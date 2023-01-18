import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';

@freezed
abstract class EditListEvent with _$EditListEvent {
  const factory EditListEvent.init() = EditListInit;

  const factory EditListEvent.add() = EditListAdd;
}
