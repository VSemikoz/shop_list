import 'package:injectable/injectable.dart';
import 'package:shop_list/src/data/adapters/product.dart';
import 'package:shop_list/src/data/data_sources/local/database/db.dart';
import 'package:shop_list/src/data/data_sources/local/database/product_table.dart';
import 'package:shop_list/src/data/models/product.dart';
import 'package:shop_list/src/domain/models/product.dart';

abstract class ProductRepositoryBase {
  Future<void> addProduct(ProductData data);

  Future<void> deleteProduct(int productId);

  Future<void> editProduct(ProductData data);

  Future<ProductData> getProductById(int id);

  Future<List<ProductEntry>> getAllProductList(int listId);

  Future<List<ProductEntry>> getFavorite();
}

@Injectable(as: ProductRepositoryBase)
class ProductRepository implements ProductRepositoryBase {
  ShopListDataBase dataBase;

  ProductRepository({
    required this.dataBase,
  });

  @override
  Future<void> addProduct(ProductData data) async {
    await dataBase.insertProduct(data.toCompanion());
  }

  @override
  Future<void> deleteProduct(int productId) async {
    await dataBase.deleteProduct(productId);
  }

  @override
  Future<void> editProduct(ProductData data) async {
    await dataBase.editProduct(data.toUpdateCompanion());
  }

  @override
  Future<List<ProductEntry>> getAllProductList(int listId) async {
    return (await dataBase.getAllProductByList(listId))
        .map((e) => e.toEntry())
        .toList();
  }

  @override
  Future<ProductData> getProductById(int id) async {
    return dataBase.getProductById(id);
  }

  @override
  Future<List<ProductEntry>> getFavorite() async {
    return (await dataBase.getFavorite()).map((e) => e.toEntry()).toList();
  }
}
