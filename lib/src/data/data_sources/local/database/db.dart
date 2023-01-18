import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:shop_list/src/data/models/category.dart';
import 'package:shop_list/src/data/models/product.dart';

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

  ///Category
  Future<void> insertCategory(CategoryItemsCompanion companion) async {
    return transaction(() async {
      await into(categoryItems).insert(companion, mode: InsertMode.replace);
    });
  }

  Future<void> deleteCategory(int id) async {
    return transaction(() async {
      final products = await (select(productItems)
            ..where((tbl) => tbl.categoryId.equals(id)))
          .get();
      final ids = products.map((e) => e.id);

      await (update(productItems)..where((t) => t.id.isIn(ids))).write(
        ProductItemsCompanion(
          categoryId: Value.absent(),
        ),
      );
      await (delete(categoryItems)..where((tbl) => tbl.id.equals(id))).go();
    });
  }

  Future<void> editCategory(CategoryItemsCompanion companion) async {
    return transaction(() async {
      await update(categoryItems).replace(companion);
    });
  }

  // Future<void> editCategories(List<CategoryItemsCompanion> companions) async {
  //   return transaction(() async {
  //   });
  // }

  Future<List<CategoryData>> getAllCategories() async {
    return (await select(categoryItems).get())
        .map((e) => e.toCompanion(false).toItem())
        .toList();
  }

  ///Lists
  Future<void> insertList(ListItemsCompanion companion) async {
    return transaction(() async {
      await into(listItems).insert(companion, mode: InsertMode.replace);
    });
  }

  Future<void> editList(ListItemsCompanion companion) async {
    return transaction(() async {
      await update(listItems).replace(companion);
    });
  }

  Future<void> deleteList(int id) async {
    return transaction(() async {
      await (delete(productItems)..where((tbl) => tbl.listId.equals(id))).go();
      await (delete(listItems)..where((tbl) => tbl.id.equals(id))).go();
    });
  }

  Future<List<ListData>> getAllLists() async {
    return (await select(listItems).get())
        .map((e) => e.toCompanion(false).toItem())
        .toList();
  }

  Future<ListData> getListById(int id) async {
    return (await (select(listItems)
              ..where(
                (tbl) => tbl.id.equals(id),
              ))
            .getSingle())
        .toCompanion(false)
        .toItem();
  }

  ///Product

  Future<void> insertProduct(ProductItemsCompanion companion) async {
    return transaction(() async {
      await into(productItems).insert(companion, mode: InsertMode.replace);
    });
  }

  Future<void> editProduct(ProductItemsCompanion companion) async {
    return transaction(() async {
      await update(productItems).replace(companion);
    });
  }

  Future<void> deleteProduct(int id) async {
    return transaction(() async {
      await (delete(productItems)..where((tbl) => tbl.id.equals(id))).go();
    });
  }

  Future<List<ProductData>> getAllProductByList(int listId) async {
    return (await (select(productItems)
              ..where(
                (tbl) => tbl.listId.equals(listId),
              ))
            .get())
        .map((e) => e.toCompanion(false).toItem())
        .toList();
  }

  Future<ProductData> getProductById(int id) async {
    return (await (select(productItems)
              ..where(
                (tbl) => tbl.id.equals(id),
              ))
            .getSingle())
        .toCompanion(false)
        .toItem();
  }
}
