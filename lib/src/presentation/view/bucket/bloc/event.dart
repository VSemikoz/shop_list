import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shop_list/src/domain/models/product.dart';

part 'event.freezed.dart';

@freezed
abstract class BucketEvent with _$BucketEvent {
  const factory BucketEvent.init() = BucketInit;

  const factory BucketEvent.refresh() = BucketRefresh;

  const factory BucketEvent.deleteProduct(
      {required ProductEntry productEntry}) = BucketDeleteProduct;

  const factory BucketEvent.editProduct(
      {required ProductEntry productEntry}) = BucketEditProduct;

  const factory BucketEvent.changeProductStatus({
    required ProductEntry productEntry,
    @Default(false) bool forceSave,
  }) = BucketChangeProductStatus;

  const factory BucketEvent.markFavorite(
      {required ProductEntry productEntry}) = BucketMarkFavorite;
}
