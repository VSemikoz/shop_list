import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shop_list/src/domain/models/list.dart';
import 'package:shop_list/src/domain/usecases/list_details.dart';
import 'package:shop_list/src/presentation/view/router/router/bloc.dart';
import 'package:shop_list/src/presentation/view/router/router/providers.dart';

import '../../../../domain/models/product.dart';
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
    on<ListDetailsAddProduct>(_add);
    on<ListDetailsEditProduct>(_editProduct);
    on<ListDetailsDeletePrduct>(_deleteProduct);
    on<ListDetailsMarkFavorite>(_markFavorite);
    on<ListDetailsOnEditListSuccess>(_onEditListSuccess);
    on<ListDetailsDeleteList>(_deleteList);
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

  _add(ListDetailsAddProduct event, Emitter emitter) async {
    final ProductEntry product = ProductEntry.insert(
      listId: list.id,
      categoryId: 0,
      name: "NAME NAME",
      description:
          "descriptiondescriptiondescriptiondescription descriptiondescriptiondescriptiondescription",
      price: 100,
      priceDescription: "R",
      isFavorite: false,
      status: ProductStatus.saved,
      count: 3,
      countDescription: 'sht',
    );
    await useCase.addProduct(product);
    await _refreshProductList(emitter);
  }

  _editProduct(ListDetailsEditProduct event, Emitter emitter) {}

  _deleteProduct(ListDetailsDeletePrduct event, Emitter emitter) {}

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

  _deleteList(ListDetailsDeleteList event, Emitter emitter) {}
}
