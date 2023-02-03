import 'package:drift/drift.dart';
import 'package:shop_list/src/data/data_sources/local/database/db.dart';
import 'package:shop_list/src/data/models/product.dart';

class ProductItems extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get listId => integer()();

  IntColumn get categoryId => integer().nullable()();

  TextColumn get name => text()();

  TextColumn get description => text()();

  IntColumn get price => integer()();

  TextColumn get priceDescription => text()();

  BoolColumn get isFavorite => boolean()();

  TextColumn get status => text()();

  IntColumn get count => integer()();

  TextColumn get countDescription => text()();
}

extension ProductItemsCompanionExtension on ProductItemsCompanion {
  ProductData toItem() {
    return ProductData(
      id: id.value,
      listId: listId.value,
      categoryId: categoryId.value,
      name: name.value,
      description: description.value,
      price: price.value,
      priceDescription: priceDescription.value,
      isFavorite: isFavorite.value,
      status: status.value,
      count: count.value,
      countDescription: countDescription.value,
    );
  }
}

extension ProductDataExtension on ProductData {
  ProductItemsCompanion toCompanion() {
    return ProductItemsCompanion.insert(
      listId: listId,
      categoryId: Value(categoryId),
      name: name,
      description: description,
      price: price,
      priceDescription: priceDescription,
      isFavorite: isFavorite,
      status: status,
      count: count,
      countDescription: countDescription,
    );
  }

  ProductItemsCompanion toUpdateCompanion() {
    return ProductItemsCompanion(
      id: Value(id),
      listId: Value(listId),
      categoryId: Value(categoryId),
      name: Value(name),
      description: Value(description),
      price: Value(price),
      priceDescription: Value(priceDescription),
      isFavorite: Value(isFavorite),
      status: Value(status),
      count: Value(count),
      countDescription: Value(countDescription),
    );
  }
}
