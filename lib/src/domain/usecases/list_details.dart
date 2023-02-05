import 'package:injectable/injectable.dart';
import 'package:shop_list/src/data/adapters/list.dart';
import 'package:shop_list/src/data/adapters/product.dart';
import 'package:shop_list/src/data/repository/list.dart';
import 'package:shop_list/src/data/repository/product.dart';
import 'package:shop_list/src/domain/models/list.dart';
import 'package:shop_list/src/domain/models/product.dart';

import '../../data/repository/data_change.dart';

abstract class ListDetailsUseCaseBase {
  Future<ListEntry> getList(int id);

  Future<ListEntry> editList(ListEntry entry);

  Future<void> addProduct(ProductEntry entry);

  Future<List<ProductEntry>> getProductsByList(int listId);

  Future<void> deleteProduct(int id);

  Future<void> changeProductStatus(ProductEntry data, ProductStatus status);

  Future<void> changeFavoriteStatus(ProductEntry data, bool isFavorite);
}

@Injectable(as: ListDetailsUseCaseBase)
class ListDetailsUseCase implements ListDetailsUseCaseBase {
  ListRepositoryBase listRepository;
  ProductRepositoryBase productRepository;
  DataChangeRepositoryBase dataChangeRepository;

  ListDetailsUseCase({
    required this.listRepository,
    required this.productRepository,
    required this.dataChangeRepository,
  });

  @override
  Future<void> addProduct(ProductEntry entry) async {
    await productRepository.addProduct(entry.toData());
  }

  @override
  Future<void> changeProductStatus(
    ProductEntry entry,
    ProductStatus status,
  ) async {
    final productToSave = entry.copyWith(status: status);
    await productRepository.editProduct(productToSave.toData());
    dataChangeRepository.notifyBucket(productToSave.id);
  }

  @override
  Future<void> deleteProduct(int id) async {
    await productRepository.deleteProduct(id);
  }

  @override
  Future<ListEntry> editList(ListEntry entry) async {
    await listRepository.editList(entry.toData());
    return listRepository.getById(entry.id);
  }

  @override
  Future<ListEntry> getList(int id) async {
    return listRepository.getById(id);
  }

  @override
  Future<List<ProductEntry>> getProductsByList(int listId) async {
    return await productRepository.getAllProductList(listId);
  }

  @override
  Future<void> changeFavoriteStatus(ProductEntry data, bool isFavorite) async {
    final productToSave = data.copyWith(isFavorite: isFavorite);
    await productRepository.editProduct(productToSave.toData());
    dataChangeRepository.notifyFavorite(productToSave.id);
  }
}
