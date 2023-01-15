class CategoryData {
  final int id;
  final String name;

//<editor-fold desc="Data Methods">

  const CategoryData({
    required this.id,
    required this.name,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryData &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name);

  @override
  int get hashCode => id.hashCode ^ name.hashCode;

  @override
  String toString() {
    return 'CategoryData{' + ' id: $id,' + ' name: $name,' + '}';
  }

  CategoryData copyWith({
    int? id,
    String? name,
  }) {
    return CategoryData(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
    };
  }

  factory CategoryData.fromMap(Map<String, dynamic> map) {
    return CategoryData(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

//</editor-fold>
}
