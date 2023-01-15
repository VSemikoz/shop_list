import 'package:shop_list/src/data/models/product.dart';
import 'package:shop_list/src/domain/models/product.dart';

extension ParentDataExtenion on ProductData {
  ProductEntry toEntry() {
    return ProductEntry(
      id: id,
      listId: listId,
      categoryId: categoryId,
      name: name,
      description: description,
      price: price,
      priceDescription: priceDescription,
      isFavorite: isFavorite,
      status: ProductStatusExtenion.getStatus(status),
      count: count,
      countDescription: countDescription,
    );
  }
}

extension ProductEntryExtenion on ProductEntry {
  ProductData toData() {
    return ProductData(
      id: id,
      listId: listId,
      categoryId: categoryId,
      name: name,
      description: description,
      price: price,
      priceDescription: priceDescription,
      isFavorite: isFavorite,
      status: status.getName(),
      count: count,
      countDescription: countDescription,
    );
  }
}

extension ProductStatusExtenion on ProductStatus {
  static ProductStatus getStatus(String value) {
    if (value == "saved") {
      return ProductStatus.saved;
    } else if (value == "need") {
      return ProductStatus.need;
    } else if (value == "ready") {
      return ProductStatus.ready;
    }
    return ProductStatus.none;
  }

  String getName() {
    switch (this) {
      case ProductStatus.saved:
        return "saved";
      case ProductStatus.need:
        return "need";
      case ProductStatus.ready:
        return "ready";
      case ProductStatus.none:
        return "none";
    }
  }
}
