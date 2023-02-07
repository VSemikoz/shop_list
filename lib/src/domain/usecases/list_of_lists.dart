import 'package:injectable/injectable.dart';
import 'package:shop_list/src/data/adapters/list.dart';
import 'package:shop_list/src/data/models/export_data.dart';
import 'package:shop_list/src/data/repository/category.dart';
import 'package:shop_list/src/data/repository/data_change.dart';
import 'package:shop_list/src/data/repository/import_export.dart';
import 'package:shop_list/src/data/repository/list.dart';
import 'package:shop_list/src/data/repository/product.dart';
import 'package:shop_list/src/domain/models/list.dart';

abstract class ListOfListsUseCaseBase {
  Future<void> addOneList(ListEntry entry);

  Future<List<ListEntry>> getAllLists();

  Future<void> export(String path);

  Future<void> import(String path);

  Future<String> getFullImportExportPath(String path);
}

@Injectable(as: ListOfListsUseCaseBase)
class ListOfListsUseCase implements ListOfListsUseCaseBase {
  final ListRepositoryBase listRepository;
  final CategoryRepositoryBase categoryRepository;
  final ProductRepositoryBase productRepository;
  final DataChangeRepositoryBase dataChangeRepository;
  final ImportExportDataRepositoryBase importExportDataRepository;

  const ListOfListsUseCase({
    required this.listRepository,
    required this.categoryRepository,
    required this.productRepository,
    required this.dataChangeRepository,
    required this.importExportDataRepository,
  });

  Future<void> addOneList(ListEntry entry) {
    return listRepository.addOneList(entry.toData());
  }

  @override
  Future<List<ListEntry>> getAllLists() {
    return listRepository.getAllLists();
  }

  @override
  Future<void> export(String path) async {
    final products = await productRepository.getAll();
    final lists = await listRepository.getAll();
    final categories = await categoryRepository.getAll();
    final data = ExportData(
      products: products,
      lists: lists,
      categories: categories,
    );
    await importExportDataRepository.exportDataFromPath(path, data);
  }

  @override
  Future<void> import(String path) async {
    final data = await importExportDataRepository.importDataFromPath(path);
    if (data == null) return;

    await productRepository.importNewProducts(data.products);
    await listRepository.importNewLists(data.lists);
    await categoryRepository.importNewCategories(data.categories);
  }

  @override
  Future<String> getFullImportExportPath(String path) {
    return importExportDataRepository.getFilePath(path);
  }
}
