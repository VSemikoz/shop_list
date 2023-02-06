import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shop_list/src/presentation/view/list_of_lists/bloc/list_of_lists.dart';

part 'event.freezed.dart';

@freezed
abstract class ListOfListsEvent with _$ListOfListsEvent {
  const factory ListOfListsEvent.init() = ListOfListsInit;

  const factory ListOfListsEvent.changeCurrVariant(
      {required ListViewVariant variant}) = ListOfListsChangeCurrVariant;

  const factory ListOfListsEvent.addList({
    required String name,
    required Color color,
  }) = ListOfListsAddList;

  const factory ListOfListsEvent.import() = ListOfListsImport;

  const factory ListOfListsEvent.export() = ListOfListsExport;
}
