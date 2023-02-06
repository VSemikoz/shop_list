import 'package:injectable/injectable.dart';
import 'package:shop_list/src/data/adapters/category.dart';
import 'package:shop_list/src/data/data_sources/local/database/category_table.dart';
import 'package:shop_list/src/data/data_sources/local/database/db.dart';
import 'package:shop_list/src/data/models/category.dart';
import 'package:shop_list/src/domain/models/category.dart';

abstract class CategoryRepositoryBase {
  Future<void> addOneCategory(CategoryData data);

  Future<List<CategoryEntry>> getAllCategories();

  Future<void> deleteCategory(int id);

  Future<void> editCategory(CategoryData categoryData);

  Future<void> importNewCategories(List<CategoryData> data);

  Future<List<CategoryData>> getAll();
}

@Injectable(as: CategoryRepositoryBase)
class CategoryRepositoryImpl implements CategoryRepositoryBase {
  final ShopListDataBase database;

  const CategoryRepositoryImpl({
    required this.database,
  });

  Future<void> addOneCategory(CategoryData data) async =>
      database.insertCategory(data.toCompanion());

  @override
  Future<List<CategoryEntry>> getAllCategories() async {
    return (await database.getAllCategories()).map((e) => e.toEntry()).toList();
  }

  @override
  Future<void> deleteCategory(int id) async {
    return await database.deleteCategory(id);
  }

  @override
  Future<void> editCategory(CategoryData categoryData) async {
    return await database.editCategory(categoryData.toUpdateCompanion());
  }

  @override
  Future<void> importNewCategories(List<CategoryData> data) async {
    await database.deleteAllCategories();
    await database
        .insertCategories(data.map((e) => e.toUpdateCompanion()).toList());
  }

  @override
  Future<List<CategoryData>> getAll() async {
    return await database.getAllCategories();
  }
}
