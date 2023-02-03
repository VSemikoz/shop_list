import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shop_list/src/domain/models/product.dart';

part 'state.freezed.dart';

@freezed
abstract class EditProductState with _$EditProductState {
  const factory EditProductState.initial(ProductEntry product) = EditProductInitial;

  const factory EditProductState.loading() = EditProductLoading;

  const factory EditProductState.success() = EditProductSuccess;
}
