import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shop_list/src/presentation/view/router/router/bloc.dart';
import 'package:shop_list/src/presentation/view/router/router/providers.dart';

import '../../../../domain/models/product.dart';
import '../../../../domain/usecases/bucket.dart';
import '../../router/router/event.dart';
import 'bucket.dart';

@Injectable()
class BucketBloc extends Bloc<BucketEvent, BucketState> {
  BucketBloc({
    @factoryParam required this.router,
    required this.useCase,
  }) : super(BucketState.loading()) {
    on<BucketRefresh>(_refresh);
    on<BucketInit>(_init);
    on<BucketEditProduct>(_editProduct);
    on<BucketDeleteProduct>(_deleteProduct);
    on<BucketMarkFavorite>(_markFavorite);
    on<BucketChangeProductStatus>(_onChangeProductStatus);
  }

  final BucketUseCaseBase useCase;

  final RouterEventSink router;
  final List<ProductEntry> currentProducts = [];

  _init(BucketInit event, Emitter emitter) async {
    useCase.bucketUpdate().listen(
          (event) {
        if (event != null) add(BucketEvent.refresh());
      },
    );
    await _refreshProductList(emitter);
  }

  _refresh(BucketRefresh event, Emitter emitter)async{
    await  _refreshProductList(emitter);
  }

  Future<void> _refreshProductList(Emitter emitter) async {
    emitter(_makeSuccessState([]));
    final products = await useCase.getBucket();
    currentProducts.clear();
    currentProducts.addAll(products);
    emitter(_makeSuccessState(currentProducts));
  }

  _editProduct(BucketEditProduct event, Emitter emitter) async {
    await _navigateAddEditProduct(EditProductMode.edit, event.productEntry);
  }

  _deleteProduct(BucketDeleteProduct event, Emitter emitter) async {
    useCase.deleteProduct(event.productEntry.id);
    final products = await useCase.getBucket();
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
          onAddSuccess: () => add(BucketEvent.init()),
          onDeleteSuccess: () => add(BucketEvent.init()),
          onEditSuccess: () => add(BucketEvent.init()),
        ),
      ),
    );
  }

  _markFavorite(BucketMarkFavorite event, Emitter emitter) async {
    final statusToChange = event.productEntry.isFavorite ? false : true;
    useCase.changeFavoriteStatus(event.productEntry, statusToChange);

    final products = await useCase.getBucket();
    currentProducts.clear();
    currentProducts.addAll(products);
    emitter(_makeSuccessState(currentProducts));
  }

  _onChangeProductStatus(
      BucketChangeProductStatus event,
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
    final products = await useCase.getBucket();
    currentProducts.clear();
    currentProducts.addAll(products);
    emitter(_makeSuccessState(currentProducts));
  }

  BucketState _makeSuccessState(List<ProductEntry> products) {
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

    return BucketState.success(
      saveProducts: save,
      needProducts: need,
      readyProducts: ready,
    );
  }
}
