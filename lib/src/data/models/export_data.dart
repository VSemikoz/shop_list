import 'package:shop_list/src/data/models/category.dart';
import 'package:shop_list/src/data/models/list.dart';
import 'package:shop_list/src/data/models/product.dart';

class ExportData {
  final List<ProductData> products;
  final List<ListData> lists;
  final List<CategoryData> categories;

  const ExportData({
    required this.products,
    required this.lists,
    required this.categories,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExportData &&
          runtimeType == other.runtimeType &&
          products == other.products &&
          lists == other.lists &&
          categories == other.categories);

  @override
  int get hashCode => products.hashCode ^ lists.hashCode ^ categories.hashCode;

  @override
  String toString() {
    return 'ExportData{' +
        ' products: $products,' +
        ' lists: $lists,' +
        ' categories: $categories,' +
        '}';
  }

  ExportData copyWith({
    List<ProductData>? products,
    List<ListData>? lists,
    List<CategoryData>? categories,
  }) {
    return ExportData(
      products: products ?? this.products,
      lists: lists ?? this.lists,
      categories: categories ?? this.categories,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'products': this.products.map((e) => e.toMap()).toList(),
      'lists': this.lists.map((e) => e.toMap()).toList(),
      'categories': this.categories.map((e) => e.toMap()).toList(),
    };
  }

  factory ExportData.fromMap(Map<String, dynamic> map) {
    return ExportData(
      products:
          (map['products'] as List).map((e) => ProductData.fromMap(e)).toList(),
      lists: (map['lists'] as List).map((e) => ListData.fromMap(e)).toList(),
      categories: (map['categories'] as List)
          .map((e) => CategoryData.fromMap(e))
          .toList(),
    );
  }
}
