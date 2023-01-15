import 'package:injectable/injectable.dart';
import 'package:shop_list/src/data/adapters/list.dart';
import 'package:shop_list/src/data/repository/list.dart';
import 'package:shop_list/src/domain/models/list.dart';

abstract class ListOfListsUseCaseBase {
  Future<void> addOneList(ListEntry entry);

  Future<List<ListEntry>> getAllLists();
}

@Injectable(as: ListOfListsUseCaseBase)
class ListOfListsUseCase implements ListOfListsUseCaseBase {
  final ListRepositoryBase listRepository;

  const ListOfListsUseCase({
    required this.listRepository,
  });

  Future<void> addOneList(ListEntry entry) {
    return listRepository.addOneList(entry.toData());
  }

  @override
  Future<List<ListEntry>> getAllLists() {
    return listRepository.getAllLists();
  }
}
