import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shop_list/src/domain/models/product.dart';

part 'state.freezed.dart';

@freezed
abstract class FavoriteState with _$FavoriteState {
  const factory FavoriteState.loading() = FavoriteLoading;

  const factory FavoriteState.success({
    required List<ProductEntry> saveProducts,
    required List<ProductEntry> needProducts,
    required List<ProductEntry> readyProducts,
  }) = FavoriteSuccess;
}
