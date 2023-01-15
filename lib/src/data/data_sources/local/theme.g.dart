// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ThemeStatusAdapter extends TypeAdapter<ThemeStatus> {
  @override
  final int typeId = 0;

  @override
  ThemeStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ThemeStatus.light;
      default:
        return ThemeStatus.light;
    }
  }

  @override
  void write(BinaryWriter writer, ThemeStatus obj) {
    switch (obj) {
      case ThemeStatus.light:
        writer.writeByte(0);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThemeStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
