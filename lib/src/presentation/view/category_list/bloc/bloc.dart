import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shop_list/src/presentation/view/router/router/bloc.dart';
import 'package:shop_list/src/presentation/view/router/router/event.dart';

import '../../../../domain/models/category.dart';
import '../../../../domain/usecases/category_list.dart';
import '../../router/router/providers.dart';
import 'category_list.dart';

@Injectable()
class CategoriesListBloc
    extends Bloc<CategoriesListEvent, CategoriesListState> {
  CategoriesListBloc({
    required this.useCase,
    @factoryParam required this.router,
  }) : super(CategoriesListState.loading()) {
    on<CategoriesListInit>(_init);
    on<CategoriesListAdd>(_add);
    on<CategoriesListEdit>(_edit);
  }

  final CategoryListUseCaseBase useCase;
  final RouterEventSink router;

  final List<CategoryEntry> currentCategoriesList = [];

  _init(CategoriesListInit event, Emitter emitter) async {
    await _refreshData(emitter);
  }

  Future<void> _refreshData(Emitter emitter) async {
    final categories = await useCase.loadAllCategories();
    currentCategoriesList.clear();
    currentCategoriesList.addAll(categories);
    emitter(CategoriesListState.success(
      categories: [...currentCategoriesList],
    ));
  }

  _add(CategoriesListAdd event, Emitter emitter) {
    router.add(
      RouterEvent.editCategory(
        transaction: EditCategoryTransaction(
          mode: CategoryEditMode.create,
          onSuccess: () => add(CategoriesListEvent.init()),
        ),
      ),
    );
  }

  _edit(CategoriesListEdit event, Emitter emitter) {
    router.add(
      RouterEvent.editCategory(
        transaction: EditCategoryTransaction(
          mode: CategoryEditMode.edit,
          categoryEntry: event.entry,
          onSuccess: () => add(CategoriesListEvent.init()),
        ),
      ),
    );
  }
}
