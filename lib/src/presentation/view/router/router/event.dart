import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shop_list/src/presentation/view/router/router/providers.dart';

part 'event.freezed.dart';

@freezed
abstract class RouterEvent with _$RouterEvent {
  const factory RouterEvent.pop() = RouteOnPop;

  const factory RouterEvent.popTop(int n) = RouteOnPopTop;

  const factory RouterEvent.listOfLists() = RouteListOfLists;

  const factory RouterEvent.editList({
    required EditListTransaction transaction,
  }) = RouteEditList;

  const factory RouterEvent.listDetails({
    required ListDetailsTransaction transaction,
  }) = RouteListDetails;

  const factory RouterEvent.favorite() = RouteFavorite;

  const factory RouterEvent.categoryList() = RouteCategoryList;

  const factory RouterEvent.editCategory({
    required EditCategoryTransaction transaction,
  }) = RouteEditCategory;

  const factory RouterEvent.bucket() = RouteBucket;

  const factory RouterEvent.editProduct({
    required EditProductTransaction transaction,
  }) = RouteEditProduct;
}
