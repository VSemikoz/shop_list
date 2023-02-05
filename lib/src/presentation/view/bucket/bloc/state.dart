import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shop_list/src/domain/models/product.dart';

part 'state.freezed.dart';

@freezed
abstract class BucketState with _$BucketState {
  const factory BucketState.loading() = BucketLoading;

  const factory BucketState.success({
    required List<ProductEntry> saveProducts,
    required List<ProductEntry> needProducts,
    required List<ProductEntry> readyProducts,
  }) = BucketSuccess;
}
