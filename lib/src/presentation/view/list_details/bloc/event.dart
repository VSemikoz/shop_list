import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';

@freezed
abstract class ListDetailsEvent with _$ListDetailsEvent {
  const factory ListDetailsEvent.init() = ListDetailsInit;

  const factory ListDetailsEvent.add() = ListDetailsAdd;

  const factory ListDetailsEvent.edit() =
  ListDetailsEdit;
}
