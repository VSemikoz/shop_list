import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:shop_list/src/data/models/category.dart';

import '../../../models/list.dart';
import 'category_table.dart';
import 'list_table.dart';
import 'product_table.dart';

part 'db.g.dart';

const String _dataBaseName = "shop_list.db";

LazyDatabase _openConnection() => LazyDatabase(
      () async {
        final dbFolder = await getApplicationDocumentsDirectory();
        final file = File(p.join(dbFolder.path, _dataBaseName));

        //TODO remove
        // if (!await file.exists()) {
        //   // Extract the pre-populated database file from assets
        //   final blob = await rootBundle.load('assets/my_database.db');
        //   final buffer = blob.buffer;
        //   await file.writeAsBytes(
        //       buffer.asUint8List(blob.offsetInBytes, blob.lengthInBytes));
        // }

        return NativeDatabase.createInBackground(file);
      },
    );

@DriftDatabase(tables: [
  CategoryItems,
  ListItems,
  ProductItems,
])
class ShopListDataBase extends _$ShopListDataBase {
  @override
  int get schemaVersion => 1;

  ShopListDataBase() : super(_openConnection());

  Future<void> insertCategory(CategoryItemsCompanion companion) async {
    return transaction(() async {
      await into(categoryItems).insert(companion, mode: InsertMode.replace);
    });
  }

  Future<void> deleteCategory(int id) async {
    return transaction(() async {
      await (delete(categoryItems)..where((tbl) => tbl.id.equals(id))).go();
    });
  }

  Future<void> editCategory(CategoryItemsCompanion companion) async {
    return transaction(() async {
      await update(categoryItems).replace(companion);
    });
  }

  Future<List<CategoryData>> getAllCategories() async {
    return (await select(categoryItems).get())
        .map((e) => e.toCompanion(false))
        .map((e) => e.toItem())
        .toList();
  }

  Future<void> insertList(ListItemsCompanion companion) async {
    return transaction(() async {
      await into(listItems).insert(companion, mode: InsertMode.replace);
    });
  }

  Future<List<ListData>> getAllLists() async {
    return (await select(listItems).get())
        .map((e) => e.toCompanion(false))
        .map((e) => e.toItem())
        .toList();
  }
}
