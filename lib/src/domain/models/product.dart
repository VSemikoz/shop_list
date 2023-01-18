enum ProductStatus {
  saved,
  need,
  ready,
  none,
}

class ProductEntry {
  final int id;
  final int listId;
  final int categoryId;
  final String name;
  final String description;
  final int price;
  final String priceDescription;
  final bool isFavorite;
  final ProductStatus status;
  final int count;
  final String countDescription;

//<editor-fold desc="Data Methods">

  const ProductEntry({
    required this.id,
    required this.listId,
    required this.categoryId,
    required this.name,
    required this.description,
    required this.price,
    required this.priceDescription,
    required this.isFavorite,
    required this.status,
    required this.count,
    required this.countDescription,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductEntry &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          listId == other.listId &&
          categoryId == other.categoryId &&
          name == other.name &&
          description == other.description &&
          price == other.price &&
          priceDescription == other.priceDescription &&
          isFavorite == other.isFavorite &&
          status == other.status &&
          count == other.count &&
          countDescription == other.countDescription);

  @override
  int get hashCode =>
      id.hashCode ^
      listId.hashCode ^
      categoryId.hashCode ^
      name.hashCode ^
      description.hashCode ^
      price.hashCode ^
      priceDescription.hashCode ^
      isFavorite.hashCode ^
      status.hashCode ^
      count.hashCode ^
      countDescription.hashCode;

  @override
  String toString() {
    return 'ProductEntry{' +
        ' id: $id,' +
        ' listId: $listId,' +
        ' categoryId: $categoryId,' +
        ' name: $name,' +
        ' description: $description,' +
        ' price: $price,' +
        ' priceDescription: $priceDescription,' +
        ' isFavorite: $isFavorite,' +
        ' status: $status,' +
        ' count: $count,' +
        ' countDescription: $countDescription,' +
        '}';
  }

  ProductEntry copyWith({
    int? id,
    int? listId,
    int? categoryId,
    String? name,
    String? description,
    int? price,
    String? priceDescription,
    bool? isFavorite,
    ProductStatus? status,
    int? count,
    String? countDescription,
  }) {
    return ProductEntry(
      id: id ?? this.id,
      listId: listId ?? this.listId,
      categoryId: categoryId ?? this.categoryId,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      priceDescription: priceDescription ?? this.priceDescription,
      isFavorite: isFavorite ?? this.isFavorite,
      status: status ?? this.status,
      count: count ?? this.count,
      countDescription: countDescription ?? this.countDescription,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'listId': this.listId,
      'categoryId': this.categoryId,
      'name': this.name,
      'description': this.description,
      'price': this.price,
      'priceDescription': this.priceDescription,
      'isFavorite': this.isFavorite,
      'status': this.status,
      'count': this.count,
      'countDescription': this.countDescription,
    };
  }

  factory ProductEntry.fromMap(Map<String, dynamic> map) {
    return ProductEntry(
      id: map['id'] as int,
      listId: map['listId'] as int,
      categoryId: map['categoryId'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      price: map['price'] as int,
      priceDescription: map['priceDescription'] as String,
      isFavorite: map['isFavorite'] as bool,
      status: map['status'] as ProductStatus,
      count: map['count'] as int,
      countDescription: map['countDescription'] as String,
    );
  }

  factory ProductEntry.insert({
    required int listId,
    required int categoryId,
    required String name,
    required String description,
    required int price,
    required String priceDescription,
    required bool isFavorite,
    required ProductStatus status,
    required int count,
    required String countDescription,
  }) {
    return ProductEntry(
      id: 0,
      listId: listId,
      categoryId: categoryId,
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

//</editor-fold>
}
