import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';

@freezed
abstract class CreateListEvent with _$CreateListEvent {
  const factory CreateListEvent.init() = CreateListInit;

  const factory CreateListEvent.add() = CreateListAdd;
}
