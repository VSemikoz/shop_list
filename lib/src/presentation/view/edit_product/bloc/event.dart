import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';

@freezed
abstract class EditProductEvent with _$EditProductEvent {
  const factory EditProductEvent.init() = EditProductInit;

  const factory EditProductEvent.add() = EditProductAdd;

  const factory EditProductEvent.edit() = EditProductEdit;

  const factory EditProductEvent.delete() = EditProductDelete;
}
