import 'package:injectable/injectable.dart';
import 'package:shop_list/src/data/adapters/product.dart';

import '../../data/repository/data_change.dart';
import '../../data/repository/list.dart';
import '../../data/repository/product.dart';
import '../models/list.dart';
import '../models/product.dart';

abstract class FavoriteUseCaseBase {
  Future<ListEntry> getList(int id);

  Future<List<ProductEntry>> getFavorite();

  Future<void> deleteProduct(int id);

  Future<void> changeProductStatus(ProductEntry data, ProductStatus status);

  Future<void> changeFavoriteStatus(ProductEntry data, bool isFavorite);

  Stream<int?> favoriteUpdate();
}

@Injectable(as: FavoriteUseCaseBase)
class FavoriteUseCase implements FavoriteUseCaseBase {
  ListRepositoryBase listRepository;
  ProductRepositoryBase productRepository;
  DataChangeRepositoryBase dataChangeRepository;

  FavoriteUseCase({
    required this.listRepository,
    required this.productRepository,
    required this.dataChangeRepository,
  });


  @override
  Future<void> changeProductStatus(
      ProductEntry entry,
      ProductStatus status,
      ) async {
    final productToSave = entry.copyWith(status: status);
    return await productRepository.editProduct(productToSave.toData());
  }

  @override
  Future<void> deleteProduct(int id) async {
    await productRepository.deleteProduct(id);
  }

  @override
  Future<ListEntry> getList(int id) async {
    return listRepository.getById(id);
  }


  @override
  Future<void> changeFavoriteStatus(ProductEntry data, bool isFavorite) async {
    final productToSave = data.copyWith(isFavorite: isFavorite);
    return await productRepository.editProduct(productToSave.toData());
  }

  @override
  Future<List<ProductEntry>> getFavorite()async {
    return await productRepository.getFavorite();
  }

  @override
  Stream<int?> favoriteUpdate() {
    return dataChangeRepository.favoriteUpdate;
  }
}