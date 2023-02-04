import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shop_list/src/presentation/view/router/router/bloc.dart';
import 'package:shop_list/src/presentation/view/router/router/providers.dart';

import '../../../../domain/models/product.dart';
import '../../../../domain/usecases/favorite.dart';
import '../../router/router/event.dart';
import 'favorite.dart';

@Injectable()
class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc({
    @factoryParam required this.router,
    required this.useCase,
  }) : super(FavoriteState.loading()) {
    on<FavoriteRefresh>(_refresh);
    on<FavoriteInit>(_init);
    on<FavoriteEditProduct>(_editProduct);
    on<FavoriteDeleteProduct>(_deleteProduct);
    on<FavoriteMarkFavorite>(_markFavorite);
    on<FavoriteChangeProductStatus>(_onChangeProductStatus);
  }

  final FavoriteUseCaseBase useCase;

  final RouterEventSink router;
  final List<ProductEntry> currentProducts = [];

  _init(FavoriteInit event, Emitter emitter) async {
    useCase.favoriteUpdate().listen(
      (event) {
        if (event != null) add(FavoriteEvent.refresh());
      },
    );
    await _refreshProductList(emitter);
  }

  _refresh(FavoriteRefresh event, Emitter emitter)async{
    await  _refreshProductList(emitter);
  }

  Future<void> _refreshProductList(Emitter emitter) async {
    emitter(_makeSuccessState([]));
    final products = await useCase.getFavorite();
    currentProducts.clear();
    currentProducts.addAll(products);
    emitter(_makeSuccessState(currentProducts));
  }

  _editProduct(FavoriteEditProduct event, Emitter emitter) async {
    await _navigateAddEditProduct(EditProductMode.edit, event.productEntry);
  }

  _deleteProduct(FavoriteDeleteProduct event, Emitter emitter) async {
    useCase.deleteProduct(event.productEntry.id);
    final products = await useCase.getFavorite();
    currentProducts.clear();
    currentProducts.addAll(products);
    emitter(_makeSuccessState(currentProducts));
  }

  Future<void> _navigateAddEditProduct(
    EditProductMode mode,
    ProductEntry product,
  ) async {
    final list = await useCase.getList(product.listId);
    router.add(
      RouterEvent.editProduct(
        transaction: EditProductTransaction(
          mode: mode,
          entry: product,
          listEntry: list,
          onAddSuccess: () => add(FavoriteEvent.init()),
          onDeleteSuccess: () => add(FavoriteEvent.init()),
          onEditSuccess: () => add(FavoriteEvent.init()),
        ),
      ),
    );
  }

  _markFavorite(FavoriteMarkFavorite event, Emitter emitter) async {
    final statusToChange = event.productEntry.isFavorite ? false : true;
    useCase.changeFavoriteStatus(event.productEntry, statusToChange);

    final products = await useCase.getFavorite();
    currentProducts.clear();
    currentProducts.addAll(products);
    emitter(_makeSuccessState(currentProducts));
  }

  _onChangeProductStatus(
    FavoriteChangeProductStatus event,
    Emitter emitter,
  ) async {
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
    final products = await useCase.getFavorite();
    currentProducts.clear();
    currentProducts.addAll(products);
    emitter(_makeSuccessState(currentProducts));
  }

  FavoriteState _makeSuccessState(List<ProductEntry> products) {
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

    return FavoriteState.success(
      saveProducts: save,
      needProducts: need,
      readyProducts: ready,
    );
  }
}
