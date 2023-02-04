import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shop_list/src/domain/models/product.dart';

part 'event.freezed.dart';

@freezed
abstract class FavoriteEvent with _$FavoriteEvent {
  const factory FavoriteEvent.init() = FavoriteInit;

  const factory FavoriteEvent.refresh() = FavoriteRefresh;

  const factory FavoriteEvent.deleteProduct(
      {required ProductEntry productEntry}) = FavoriteDeleteProduct;

  const factory FavoriteEvent.editProduct(
      {required ProductEntry productEntry}) = FavoriteEditProduct;

  const factory FavoriteEvent.changeProductStatus({
    required ProductEntry productEntry,
    @Default(false) bool forceSave,
  }) = FavoriteChangeProductStatus;

  const factory FavoriteEvent.markFavorite(
      {required ProductEntry productEntry}) = FavoriteMarkFavorite;
}
