import 'package:injectable/injectable.dart';
import 'package:shop_list/src/data/adapters/category.dart';
import 'package:shop_list/src/data/repository/category.dart';
import 'package:shop_list/src/domain/models/category.dart';

abstract class CategoryEditUseCaseBase {
  Future<void> createList(CategoryEntry categoryEntry);

  Future<void> deleteCategory(int id);

  Future<void> editCategory(CategoryEntry categoryEntry);
}

@Injectable(as: CategoryEditUseCaseBase)
class CategoryEditUseCase implements CategoryEditUseCaseBase {
  CategoryRepositoryBase categoryRepository;

  CategoryEditUseCase({
    required this.categoryRepository,
  });

  Future<void> createList(CategoryEntry categoryEntry) async {
    return categoryRepository.addOneCategory(categoryEntry.toData());
  }

  @override
  Future<void> deleteCategory(int id) async {
    await categoryRepository.deleteCategory(id);
  }

  @override
  Future<void> editCategory(CategoryEntry categoryEntry) async {
    await categoryRepository.editCategory(categoryEntry.toData());
  }
}
