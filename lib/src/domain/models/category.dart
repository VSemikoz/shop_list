class CategoryEntry {
  final int id;
  final String name;

//<editor-fold desc="Data Methods">

  const CategoryEntry({
    required this.id,
    required this.name,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryEntry &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name);

  @override
  int get hashCode => id.hashCode ^ name.hashCode;

  @override
  String toString() {
    return 'CategoryEntry{' + ' id: $id,' + ' name: $name,' + '}';
  }

  CategoryEntry copyWith({
    int? id,
    String? name,
  }) {
    return CategoryEntry(
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

  factory CategoryEntry.fromMap(Map<String, dynamic> map) {
    return CategoryEntry(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  factory CategoryEntry.insert({
    required String name,
  }) {
    return CategoryEntry(
      id: 0,
      name: name,
    );
  }

//</editor-fold>
}
