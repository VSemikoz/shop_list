import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shop_list/src/domain/models/list.dart';

import '../../../../domain/usecases/list_of_lists.dart';
import 'list_of_lists.dart';

const String _defaultImportFileName = "data.json";

@Injectable()
class ListOfListsBloc extends Bloc<ListOfListsEvent, ListOfListsState> {
  final ListOfListsUseCaseBase useCase;

  ListOfListsBloc(
    this.useCase,
  ) : super(ListOfListsLoading()) {
    on<ListOfListsInit>(_onInit);
    on<ListOfListsChangeCurrVariant>(_changeCurrVariant);
    on<ListOfListsAddList>(_addList);
    on<ListOfListsImport>(_import);
    on<ListOfListsExport>(_export);
  }

  ListViewVariant currVariant = ListViewVariant.row;
  final List<ListEntry> currentLists = [];

  String? fullPath;

  _onInit(ListOfListsInit event, Emitter emitter) async {
    useCase.getFullImportExportPath(_defaultImportFileName).then(
          (value) => fullPath = value,
        );
    await refreshLists();
    emitter(ListOfListsSuccess(variant: currVariant, lists: [...currentLists]));
  }

  _import(ListOfListsImport event, Emitter emitter) async {
    await useCase.import(_defaultImportFileName);
  }

  _export(ListOfListsExport event, Emitter emitter) async {
    await useCase.export(_defaultImportFileName);
  }

  Future<void> refreshLists() async {
    final lists = await useCase.getAllLists();
    currentLists.clear();
    currentLists.addAll([...lists]);
  }

  _changeCurrVariant(ListOfListsChangeCurrVariant event, Emitter emitter) {
    currVariant = event.variant;
    emitter(ListOfListsSuccess(variant: currVariant, lists: [...currentLists]));
  }

  _addList(ListOfListsAddList event, Emitter emitter) async {
    final ListEntry entry = ListEntry.insert(
      name: event.name,
      color: event.color,
    );
    await useCase.addOneList(entry);
    await refreshLists();
    emitter(ListOfListsSuccess(variant: currVariant, lists: [...currentLists]));
  }
}
