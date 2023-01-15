import 'package:injectable/injectable.dart';
import 'package:shop_list/src/data/repository/category.dart';

import '../models/category.dart';

abstract class CategoryListUseCaseBase {
  Future<List<CategoryEntry>> loadAllCategories();
}

@Injectable(as: CategoryListUseCaseBase)
class CategoryListUseCase implements CategoryListUseCaseBase {
  final CategoryRepositoryBase categoryRepository;

  const CategoryListUseCase({
    required this.categoryRepository,
  });

  Future<List<CategoryEntry>> loadAllCategories() async {
    return categoryRepository.getAllCategories();
  }
}
