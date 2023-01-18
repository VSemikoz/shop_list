import 'package:drift/drift.dart';
import 'package:shop_list/src/data/data_sources/local/database/db.dart';
import 'package:shop_list/src/data/models/list.dart';

class ListItems extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  TextColumn get color => text()();
}

extension ListItemsCompanionExtension on ListItemsCompanion {
  ListData toItem() {
    return ListData(
      id: id.value,
      name: name.value,
      color: color.value,
    );
  }
}

extension ListDataExtension on ListData {
  ListItemsCompanion toCompanion() {
    return ListItemsCompanion.insert(
      name: name,
      color: color,
    );
  }

  ListItemsCompanion toUpdateCompanion() {
    return ListItemsCompanion(
      id: Value(id),
      name: Value(name),
      color: Value(color),
    );
  }
}
