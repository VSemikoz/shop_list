import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shop_list/src/domain/models/category.dart';
import 'package:shop_list/src/domain/usecases/category_edit.dart';
import 'package:shop_list/src/presentation/view/router/router/bloc.dart';
import 'package:shop_list/src/presentation/view/router/router/event.dart';
import 'package:shop_list/src/presentation/view/router/router/providers.dart';

import 'category_edit.dart';

@Injectable()
class CategoryEditBloc extends Bloc<CategoryEditEvent, CategoryEditState> {
  CategoryEditBloc({
    @factoryParam required this.transaction,
    @factoryParam required this.router,
    required this.useCase,
  }) : super(CategoryEditState.loading()) {
    mode = transaction.mode;
    categoryEntryToEdit = transaction.categoryEntry;
    on<CategoryEditInit>(_init);
    on<CategoryEditAdd>(_add);
    on<CategoryEditDelete>(_delete);
    on<CategoryEditEdit>(_edit);
  }

  RouterEventSink router;
  final EditCategoryTransaction transaction;
  final CategoryEditUseCaseBase useCase;

  late CategoryEditMode mode;
  CategoryEntry? categoryEntryToEdit;
  String _currentText = "";

  _init(CategoryEditInit event, Emitter emitter) {
    _updateSuccess(emitter);
  }

  _add(CategoryEditAdd event, Emitter emitter) async {
    if (mode == CategoryEditMode.create) {
      final categoryEntry = CategoryEntry.insert(name: _currentText);
      await useCase.createList(categoryEntry);
      _updateSuccess(emitter);
      _onComplete();
    }
  }

  _edit(CategoryEditEdit event, Emitter emitter) async {
    if (mode == CategoryEditMode.edit && categoryEntryToEdit != null) {
      final editCategory = categoryEntryToEdit!.copyWith(name: _currentText);
      await useCase.editCategory(editCategory);
      _updateSuccess(emitter);
      _onComplete();
    }
  }

  _delete(CategoryEditDelete event, Emitter emitter) async {
    if (mode == CategoryEditMode.edit && categoryEntryToEdit != null) {
      await useCase.deleteCategory(categoryEntryToEdit!.id);
      _updateSuccess(emitter);
      _onComplete();
    }
  }

  _onComplete() {
    transaction.onSuccess();
    router.add(RouterEvent.pop());
  }

  updateText(String text) {
    _currentText = text;
  }

  _updateSuccess(Emitter emitter) {
    emitter(CategoryEditState.success());
  }
}
