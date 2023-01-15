import 'package:drift/drift.dart';
import 'package:shop_list/src/data/data_sources/local/database/db.dart';
import 'package:shop_list/src/data/models/category.dart';

class CategoryItems extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();
}

extension CategoryItemsCompanionExtension on CategoryItemsCompanion {
  CategoryData toItem() {
    return CategoryData(
      id: id.value,
      name: name.value,
    );
  }
}

extension CategoryDataExtension on CategoryData {
  CategoryItemsCompanion toCompanion() {
    return CategoryItemsCompanion.insert(
      name: name,
    );
  }
}
