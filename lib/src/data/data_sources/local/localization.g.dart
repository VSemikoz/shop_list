// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localization.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalizationVariantAdapter extends TypeAdapter<LocalizationVariant> {
  @override
  final int typeId = 2;

  @override
  LocalizationVariant read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return LocalizationVariant.en;
      case 1:
        return LocalizationVariant.ru;
      default:
        return LocalizationVariant.en;
    }
  }

  @override
  void write(BinaryWriter writer, LocalizationVariant obj) {
    switch (obj) {
      case LocalizationVariant.en:
        writer.writeByte(0);
        break;
      case LocalizationVariant.ru:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalizationVariantAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
