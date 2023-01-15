import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
abstract class CategoryEditState with _$CategoryEditState {
  const factory CategoryEditState.loading() = CategoryEditLoading;

  const factory CategoryEditState.success() = CategoryEditSuccess;
}
