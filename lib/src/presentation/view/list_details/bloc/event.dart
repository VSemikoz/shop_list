import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';

@freezed
abstract class ListDetailsEvent with _$ListDetailsEvent {
  const factory ListDetailsEvent.init() = ListDetailsInit;

  const factory ListDetailsEvent.addProduct() = ListDetailsAddProduct;

  const factory ListDetailsEvent.deleteProduct() = ListDetailsDeletePrduct;

  const factory ListDetailsEvent.editProduct() = ListDetailsEditProduct;

  const factory ListDetailsEvent.markFavorite() = ListDetailsMarkFavorite;

  const factory ListDetailsEvent.deleteList() = ListDetailsDeleteList;

  const factory ListDetailsEvent.editList() = ListDetailsEditList;
}
