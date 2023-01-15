import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';

@freezed
abstract class CategoryEditEvent with _$CategoryEditEvent {
  const factory CategoryEditEvent.init() = CategoryEditInit;

  const factory CategoryEditEvent.add() = CategoryEditAdd;

  const factory CategoryEditEvent.edit() = CategoryEditEdit;

  const factory CategoryEditEvent.delete() = CategoryEditDelete;
}
