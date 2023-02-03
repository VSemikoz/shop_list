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
  }) : super(ListDetailsState.loading()) {
    list = transaction.entry;

    on<ListDetailsInit>(_init);
    on<ListDetailsEditProduct>(_editProduct);
    on<ListDetailsDeleteProduct>(_deleteProduct);
    on<ListDetailsAddProduct>(_addProduct);
    on<ListDetailsMarkFavorite>(_markFavorite);
    on<ListDetailsOnEditListSuccess>(_onEditListSuccess);
    on<ListDetailsOnDeleteListSuccess>(_onDeleteListSuccess);
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
    emitter(ListDetailsState.success(
      list: list,
      products: [],
    ));
    final products = await useCase.getProductsByList(list.id);
    currentProducts.clear();
    currentProducts.addAll(products);
    emitter(ListDetailsState.success(
      list: list,
      products: [...currentProducts],
    ));
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
    emitter(ListDetailsState.success(
      list: list,
      products: [...currentProducts],
    ));
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

  _markFavorite(ListDetailsMarkFavorite event, Emitter emitter) {}

  _onEditListSuccess(
    ListDetailsOnEditListSuccess event,
    Emitter emitter,
  ) async {
    final products = await useCase.getProductsByList(list.id);
    currentProducts.clear();
    currentProducts.addAll(products);
    list = await useCase.getList(list.id);
    emitter(ListDetailsState.success(
      list: list,
      products: [...currentProducts],
    ));
  }

  _onDeleteListSuccess(ListDetailsOnDeleteListSuccess event, Emitter emitter) {
    router.add(RouterEvent.pop());
  }
}
