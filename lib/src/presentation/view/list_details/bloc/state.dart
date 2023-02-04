import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shop_list/src/domain/models/list.dart';
import 'package:shop_list/src/domain/models/product.dart';

part 'state.freezed.dart';

@freezed
abstract class ListDetailsState with _$ListDetailsState {
  const factory ListDetailsState.loading() = ListDetailsLoading;

  const factory ListDetailsState.success({
    required ListEntry list,
    required List<ProductEntry> saveProducts,
    required List<ProductEntry> needProducts,
    required List<ProductEntry> readyProducts,
  }) = ListDetailsSuccess;
}
