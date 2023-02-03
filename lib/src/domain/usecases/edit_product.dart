import 'package:injectable/injectable.dart';
import 'package:shop_list/src/data/adapters/product.dart';
import 'package:shop_list/src/data/repository/category.dart';
import 'package:shop_list/src/data/repository/list.dart';
import 'package:shop_list/src/data/repository/product.dart';
import 'package:shop_list/src/domain/models/category.dart';
import 'package:shop_list/src/domain/models/list.dart';
import 'package:shop_list/src/domain/models/product.dart';

abstract class EditProductUseCaseBase {
  Future<void> add(ProductEntry entry);

  Future<void> edit(ProductEntry entry);

  Future<void> delete(int id);

  Future<List<CategoryEntry>> getAllCategories();

  Future<List<ListEntry>> getAllLists();
}

@Injectable(as: EditProductUseCaseBase)
class EditProductUseCase implements EditProductUseCaseBase {
  final ProductRepositoryBase productRepository;
  final CategoryRepositoryBase categoryRepository;
  final ListRepositoryBase listRepository;

  const EditProductUseCase({
    required this.productRepository,
    required this.categoryRepository,
    required this.listRepository,
  });

  @override
  Future<void> add(ProductEntry entry) async {
    await productRepository.addProduct(entry.toData());
  }

  @override
  Future<void> delete(int id) async {
    await productRepository.deleteProduct(id);
  }

  @override
  Future<void> edit(ProductEntry entry) async {
    await productRepository.editProduct(entry.toData());
  }

  @override
  Future<List<CategoryEntry>> getAllCategories() {
    return categoryRepository.getAllCategories();
  }

  @override
  Future<List<ListEntry>> getAllLists() {
    return listRepository.getAllLists();
  }
}
