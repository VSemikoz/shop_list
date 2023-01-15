import 'package:injectable/injectable.dart';
import 'package:shop_list/src/data/data_sources/local/database/category_table.dart';
import 'package:shop_list/src/data/data_sources/local/database/db.dart';
import 'package:shop_list/src/data/models/category.dart';

abstract class CategoryRepositoryBase {
  Future<void> addOneCategory(CategoryData data);
}

@Injectable(as: CategoryRepositoryBase)
class CategoryRepositoryImpl implements CategoryRepositoryBase {
  final ShopListDataBase database;

  const CategoryRepositoryImpl({
    required this.database,
  });

  Future<void> addOneCategory(CategoryData data) async =>
      database.insertCategory(data.toCompanion());
}
