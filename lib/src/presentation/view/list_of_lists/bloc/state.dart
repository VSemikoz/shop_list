import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shop_list/src/domain/models/list.dart';

part 'state.freezed.dart';

enum ListViewVariant {
  row,
  block,
}

@freezed
abstract class ListOfListsState with _$ListOfListsState {
  const factory ListOfListsState.success({
    required ListViewVariant variant,
    required List<ListEntry> lists,
  }) = ListOfListsSuccess;

  const factory ListOfListsState.loading() = ListOfListsLoading;
}
