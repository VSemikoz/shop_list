import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
abstract class CreateListState with _$CreateListState {
  const factory CreateListState.loading() = CreateListLoading;

  const factory CreateListState.success({
    required String name,
    required Color color,
  }) = CreateListSuccess;
}
