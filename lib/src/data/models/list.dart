class ListData{
  final int id;
  final String name;
  final String color;

//<editor-fold desc="Data Methods">

  const ListData({
    required this.id,
    required this.name,
    required this.color,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ListData &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          color == other.color);

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ color.hashCode;

  @override
  String toString() {
    return 'ListData{' +
        ' id: $id,' +
        ' name: $name,' +
        ' color: $color,' +
        '}';
  }

  ListData copyWith({
    int? id,
    String? name,
    String? color,
  }) {
    return ListData(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'color': this.color,
    };
  }

  factory ListData.fromMap(Map<String, dynamic> map) {
    return ListData(
      id: map['id'] as int,
      name: map['name'] as String,
      color: map['color'] as String,
    );
  }

//</editor-fold>
}