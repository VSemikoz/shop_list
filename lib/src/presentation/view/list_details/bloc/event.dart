import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shop_list/src/domain/models/product.dart';

part 'event.freezed.dart';

@freezed
abstract class ListDetailsEvent with _$ListDetailsEvent {
  const factory ListDetailsEvent.init() = ListDetailsInit;

  const factory ListDetailsEvent.addProduct() = ListDetailsAddProduct;

  const factory ListDetailsEvent.deleteProduct(
      {required ProductEntry productEntry}) = ListDetailsDeleteProduct;

  const factory ListDetailsEvent.editProduct(
      {required ProductEntry productEntry}
      ) = ListDetailsEditProduct;

  const factory ListDetailsEvent.markFavorite() = ListDetailsMarkFavorite;

  const factory ListDetailsEvent.onDeleteListSuccess() =
      ListDetailsOnDeleteListSuccess;

  const factory ListDetailsEvent.onEditListSuccess() =
      ListDetailsOnEditListSuccess;
}
