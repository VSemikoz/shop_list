import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../../models/list.dart';
import 'category_table.dart';
import 'list_table.dart';
import 'product_table.dart';

part 'db.g.dart';

const String _dataBaseName = "shop_list.db";

LazyDatabase _openConnection() => LazyDatabase(
      () async {
        // put the database file, called db.sqlite here, into the documents folder
        // for your app.
        final dbFolder = await getApplicationDocumentsDirectory();
        final file = File(p.join(dbFolder.path, _dataBaseName));

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
