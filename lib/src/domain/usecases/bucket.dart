import 'package:injectable/injectable.dart';
import 'package:shop_list/src/data/adapters/product.dart';

import '../../data/repository/data_change.dart';
import '../../data/repository/list.dart';
import '../../data/repository/product.dart';
import '../models/list.dart';
import '../models/product.dart';

abstract class BucketUseCaseBase {
  Future<ListEntry> getList(int id);

  Future<List<ProductEntry>> getBucket();

  Future<void> deleteProduct(int id);

  Future<void> changeProductStatus(ProductEntry data, ProductStatus status);

  Future<void> changeFavoriteStatus(ProductEntry data, bool isFavorite);

  Stream<int?> bucketUpdate();

  Stream<int?> favoriteUpdate();
}

@Injectable(as: BucketUseCaseBase)
class BucketUseCase implements BucketUseCaseBase {
  ListRepositoryBase listRepository;
  ProductRepositoryBase productRepository;
  DataChangeRepositoryBase dataChangeRepository;

  BucketUseCase({
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
     await productRepository.editProduct(productToSave.toData());
    dataChangeRepository.notifyBucket(productToSave.id);
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
    await productRepository.editProduct(productToSave.toData());
    dataChangeRepository.notifyFavorite(productToSave.id);
  }

  @override
  Future<List<ProductEntry>> getBucket() async {
    return await productRepository.getBucket();
  }

  @override
  Stream<int?> bucketUpdate() {
    return dataChangeRepository.bucketUpdate;
  }

  @override
  Stream<int?> favoriteUpdate() {
    return dataChangeRepository.favoriteUpdate;
  }
}
