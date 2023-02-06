import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shop_list/src/domain/models/list.dart';
import 'package:shop_list/src/domain/usecases/list_details.dart';
import 'package:shop_list/src/presentation/view/router/router/bloc.dart';
import 'package:shop_list/src/presentation/view/router/router/providers.dart';

import '../../../../domain/models/product.dart';
import '../../router/router/event.dart';
import 'list_details.dart';

@Injectable()
class ListDetailsBloc extends Bloc<ListDetailsEvent, ListDetailsState> {
  ListDetailsBloc({
    @factoryParam required this.transaction,
    @factoryParam required this.router,
    required this.useCase,
  }) : super(ListDetailsState.loading(list: transaction.entry)) {
    list = transaction.entry;

    on<ListDetailsInit>(_init);
    on<ListDetailsEditProduct>(_editProduct);
    on<ListDetailsDeleteProduct>(_deleteProduct);
    on<ListDetailsAddProduct>(_addProduct);
    on<ListDetailsMarkFavorite>(_markFavorite);
    on<ListDetailsOnEditListSuccess>(_onEditListSuccess);
    on<ListDetailsOnDeleteListSuccess>(_onDeleteListSuccess);
    on<ListDetailsChangeProductStatus>(_onChangeProductStatus);
  }

  final ListDetailsUseCaseBase useCase;

  final RouterEventSink router;
  final ListDetailsTransaction transaction;
  late ListEntry list;
  final List<ProductEntry> currentProducts = [];

  _init(ListDetailsInit event, Emitter emitter) async {
    await _refreshProductList(emitter);
  }

  Future<void> _refreshProductList(Emitter emitter) async {
    emitter(_makeSuccessState([]));
    final products = await useCase.getProductsByList(list.id);
    currentProducts.clear();
    currentProducts.addAll(products);
    emitter(_makeSuccessState(currentProducts));
  }

  _addProduct(ListDetailsAddProduct event, Emitter emitter) {
    _navigateAddEditProduct(EditProductMode.add);
  }

  _editProduct(ListDetailsEditProduct event, Emitter emitter) {
    _navigateAddEditProduct(EditProductMode.edit, event.productEntry);
  }

  _deleteProduct(ListDetailsDeleteProduct event, Emitter emitter) async {
    useCase.deleteProduct(event.productEntry.id);
    final products = await useCase.getProductsByList(list.id);
    currentProducts.clear();
    currentProducts.addAll(products);
    emitter(_makeSuccessState(currentProducts));
  }

  _navigateAddEditProduct(EditProductMode mode, [ProductEntry? product]) {
    router.add(
      RouterEvent.editProduct(
        transaction: EditProductTransaction(
          mode: mode,
          entry: product,
          listEntry: list,
          onAddSuccess: () => add(ListDetailsEvent.init()),
          onDeleteSuccess: () => add(ListDetailsEvent.init()),
          onEditSuccess: () => add(ListDetailsEvent.init()),
        ),
      ),
    );
  }

  _markFavorite(ListDetailsMarkFavorite event, Emitter emitter) async {
    final statusToChange = event.productEntry.isFavorite ? false : true;
    await useCase.changeFavoriteStatus(event.productEntry, statusToChange);

    final products = await useCase.getProductsByList(list.id);
    currentProducts.clear();
    currentProducts.addAll(products);
    emitter(_makeSuccessState(currentProducts));
  }

  _onChangeProductStatus(ListDetailsChangeProductStatus event,
      Emitter emitter,) async {
    late ProductStatus statusToSet;
    if (event.forceSave) {
      statusToSet = ProductStatus.saved;
    } else {
      switch (event.productEntry.status) {
        case ProductStatus.saved:
          statusToSet = ProductStatus.need;
          break;
        case ProductStatus.need:
          statusToSet = ProductStatus.ready;
          break;
        case ProductStatus.ready:
          statusToSet = ProductStatus.need;
          break;
        case ProductStatus.none:
          statusToSet = ProductStatus.need;
          break;
      }
    }

    useCase.changeProductStatus(event.productEntry, statusToSet);
    final products = await useCase.getProductsByList(list.id);
    currentProducts.clear();
    currentProducts.addAll(products);
    emitter(_makeSuccessState(currentProducts));
  }

  _onEditListSuccess(ListDetailsOnEditListSuccess event,
      Emitter emitter,) async {
    final products = await useCase.getProductsByList(list.id);
    currentProducts.clear();
    currentProducts.addAll(products);
    list = await useCase.getList(list.id);
    emitter(_makeSuccessState(currentProducts));
  }

  _onDeleteListSuccess(ListDetailsOnDeleteListSuccess event, Emitter emitter) {
    router.add(RouterEvent.pop());
  }

  ListDetailsState _makeSuccessState(List<ProductEntry> products, {
    ListEntry? listToSave,
  }) {
    List<ProductEntry> save = [];
    List<ProductEntry> ready = [];
    List<ProductEntry> need = [];
    for (var i = 0; i < products.length; i++) {
      final cur = products[i];
      switch (cur.status) {
        case ProductStatus.saved:
          save.add(cur);
          break;
        case ProductStatus.need:
          need.add(cur);
          break;
        case ProductStatus.ready:
          ready.add(cur);
          break;
        case ProductStatus.none:
          save.add(cur);
          break;
      }
    }

    return ListDetailsState.success(
      list: listToSave ?? list,
      saveProducts: save,
      needProducts: need,
      readyProducts: ready,
    );
  }
}
