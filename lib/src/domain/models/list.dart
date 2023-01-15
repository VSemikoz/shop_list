import 'dart:ui';

class ListEntry {
  final int id;
  final String name;
  final Color color;

//<editor-fold desc="Data Methods">

  const ListEntry({
    required this.id,
    required this.name,
    required this.color,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ListEntry &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          color == other.color);

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ color.hashCode;

  @override
  String toString() {
    return 'ListEntry{' +
        ' id: $id,' +
        ' name: $name,' +
        ' color: $color,' +
        '}';
  }

  ListEntry copyWith({
    int? id,
    String? name,
    Color? color,
  }) {
    return ListEntry(
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

  factory ListEntry.fromMap(Map<String, dynamic> map) {
    return ListEntry(
      id: map['id'] as int,
      name: map['name'] as String,
      color: map['color'] as Color,
    );
  }

  factory ListEntry.insert({
    required String name,
    required Color color,
  }) {
    return ListEntry(
      id: 0,
      name: name,
      color: color,
    );
  }

//</editor-fold>
}
