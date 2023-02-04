import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shop_list/src/domain/models/category.dart';
import 'package:shop_list/src/presentation/view/edit_product/bloc/edit_product.dart';
import 'package:shop_list/src/presentation/view/router/router/bloc.dart';
import 'package:shop_list/src/presentation/view/router/router/event.dart';
import 'package:shop_list/src/presentation/view/router/router/providers.dart';

import '../../../../domain/models/list.dart';
import '../../../../domain/models/product.dart';
import '../../../../domain/usecases/edit_product.dart';
import '../../../ui/widgets/message/primary.dart';

@Injectable()
class EditProductBloc extends Bloc<EditProductEvent, EditProductState> {
  EditProductBloc(
    @factoryParam this.transaction,
    @factoryParam this.router,
    this.useCase,
  ) : super(EditProductState.loading()) {
    mode = transaction.mode;
    initialProduct = transaction.entry;
    listEntry = transaction.listEntry;
    on<EditProductInit>(_init);
    on<EditProductAdd>(_add);
    on<EditProductEdit>(_edit);
    on<EditProductDelete>(_delete);
  }

  final EditProductUseCaseBase useCase;

  final EditProductTransaction transaction;
  final RouterEventSink router;

  late EditProductMode mode;
  late ListEntry listEntry;
  ProductEntry? initialProduct;

  final List<CategoryEntry> categories = [];
  final List<ListEntry> lists = [];

  BehaviorSubject<CategoryEntry?> categoryController =
      BehaviorSubject.seeded(null);
  BehaviorSubject<ListEntry?> listController = BehaviorSubject.seeded(null);
  BehaviorSubject<String?> nameController = BehaviorSubject.seeded(null);
  BehaviorSubject<String?> descController = BehaviorSubject.seeded(null);
  BehaviorSubject<int?> priceController = BehaviorSubject.seeded(null);
  BehaviorSubject<int?> totalPriceController = BehaviorSubject.seeded(null);
  BehaviorSubject<String?> priceDescController = BehaviorSubject.seeded(null);
  BehaviorSubject<int?> countController = BehaviorSubject.seeded(null);
  BehaviorSubject<String?> countDescController = BehaviorSubject.seeded(null);

  CategoryEntry? selectedCategory;
  ListEntry? selectedList;
  String? name;
  String? desc;
  int? price;
  int? totalPrice;
  String? priceDesc;
  int? count;
  String? countDesc;

  _init(EditProductInit event, Emitter emitter) async {
    _initialProduct();
    if (initialProduct != null) {
      emitter(EditProductState.initial(initialProduct!));
    }
    await _refreshData();
    emitter(EditProductState.success());
  }

  _initialProduct() {
    if (initialProduct == null) return;
    updateName(initialProduct!.name);
    updateDesc(initialProduct!.description);
    updatePrice(initialProduct!.price);
    updateCount(initialProduct!.count);
    if (initialProduct!.priceDescription.isNotEmpty) {
      updatePriceDesc(initialProduct!.priceDescription);
    }
    if (initialProduct!.countDescription.isNotEmpty) {
      updateCountDesc(initialProduct!.countDescription);
    }
    updateList(listEntry);
  }

  Future<void> _refreshData() async {
    final loadedCategories = await useCase.getAllCategories();
    final loadedLists = await useCase.getAllLists();
    categories.clear();
    categories.addAll(loadedCategories);
    lists.clear();
    lists.addAll(loadedLists);
    if (categories.isNotEmpty) selectedCategory = categories[0];
  }

  _add(EditProductAdd event, Emitter emitter) async {
    if (mode == EditProductMode.add) {
      if (!_validator()) {
        MessageUtils.validateFailed();
        return;
      }
      await useCase.add(_getAddProduct());
      transaction.onAddSuccess?.call();
      router.add(RouterEvent.pop());
    }
  }

  _edit(EditProductEdit event, Emitter emitter) async {
    if (mode == EditProductMode.edit) {
      if (!_validator()) {
        MessageUtils.validateFailed();
        return;
      }
      await useCase.edit(_getEditProduct());
      transaction.onEditSuccess?.call();
      router.add(RouterEvent.pop());
    }
  }

  _delete(EditProductDelete event, Emitter emitter) async {
    if (mode == EditProductMode.edit && initialProduct != null) {
      if (!_validator()) {
        MessageUtils.validateFailed();
        return;
      }
      await useCase.delete(initialProduct!.id);
      transaction.onDeleteSuccess?.call();
      router.add(RouterEvent.pop());
    }
  }

  bool _validator() {
    if (name == null || name!.isEmpty) return false;
    if (price == null) return false;

    return true;
  }

  ProductEntry _getAddProduct() {
    return ProductEntry.insert(
      listId: selectedList?.id ?? listEntry.id,
      categoryId: selectedCategory?.id,
      name: name ?? "",
      description: desc ?? "",
      price: price ?? 0,
      priceDescription: priceDesc ?? "",
      isFavorite: initialProduct?.isFavorite ?? false,
      status: ProductStatus.saved,
      count: count ?? 0,
      countDescription: countDesc ?? "",
    );
  }

  ProductEntry _getEditProduct() {
    return ProductEntry(
      id: initialProduct!.id,
      listId: selectedList?.id ?? listEntry.id,
      categoryId: selectedCategory?.id,
      name: name ?? "",
      description: desc ?? "",
      price: price ?? 0,
      priceDescription: priceDesc ?? "",
      isFavorite: initialProduct?.isFavorite ?? false,
      status: ProductStatus.saved,
      count: count ?? 0,
      countDescription: countDesc ?? "",
    );
  }

  void updateCategory(CategoryEntry entry) {
    selectedCategory = entry;
    categoryController.add(selectedCategory);
  }

  void updateList(ListEntry entry) {
    selectedList = entry;
    listController.add(selectedList);
  }

  void updateName(String value) {
    name = value;
    nameController.add(name);
  }

  void updateDesc(String value) {
    desc = value;
    descController.add(desc);
  }

  void updatePrice(int value) {
    price = value;
    priceController.add(price);
    if (count != null) {
      updateTotalPrice(price! * count!);
    }
  }

  void updateTotalPrice(int value) {
    totalPrice = value;
    totalPriceController.add(totalPrice);
  }

  void updatePriceDesc(String value) {
    priceDesc = value;
    priceDescController.add(priceDesc);
  }

  void updateCount(int value) {
    count = value;
    countController.add(count);
    if (price != null) {
      updateTotalPrice(price! * count!);
    }
  }

  void updateCountDesc(String value) {
    countDesc = value;
    countDescController.add(countDesc);
  }

  @override
  Future<void> close() async {
    super.close();
    categoryController.close();
    listController.close();
    nameController.close();
    descController.close();
    priceController.close();
    totalPriceController.close();
    priceDescController.close();
    countController.close();
    countDescController.close();
  }
}
