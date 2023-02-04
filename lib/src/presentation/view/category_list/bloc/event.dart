import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shop_list/src/domain/models/category.dart';

part 'event.freezed.dart';

@freezed
abstract class CategoriesListEvent with _$CategoriesListEvent {
  const factory CategoriesListEvent.init() = CategoriesListInit;

  const factory CategoriesListEvent.add() = CategoriesListAdd;

  const factory CategoriesListEvent.edit(CategoryEntry entry) =
      CategoriesListEdit;
}
