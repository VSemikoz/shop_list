import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/category.dart';

part 'state.freezed.dart';

@freezed
abstract class ListDetailsState with _$ListDetailsState {
  const factory ListDetailsState.loading() = ListDetailsLoading;

  const factory ListDetailsState.success(
      {required List<CategoryEntry> categories}) = ListDetailsSuccess;
}
