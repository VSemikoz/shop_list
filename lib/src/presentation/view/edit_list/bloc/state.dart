import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
abstract class EditListState with _$EditListState {
  const factory EditListState.loading() = EditListLoading;

  const factory EditListState.success({
    required String name,
    required Color color,
  }) = EditListSuccess;
}
