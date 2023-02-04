import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/category.dart';

part 'state.freezed.dart';

@freezed
abstract class CategoriesListState with _$CategoriesListState {
  const factory CategoriesListState.loading() = CategoriesListLoading;

  const factory CategoriesListState.success(
      {required List<CategoryEntry> categories}) = CategoriesListSuccess;
}
