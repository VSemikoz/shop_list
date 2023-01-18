import 'package:injectable/injectable.dart';
import 'package:shop_list/src/data/adapters/list.dart';
import 'package:shop_list/src/data/repository/list.dart';
import 'package:shop_list/src/domain/models/list.dart';

abstract class CreateListUseCaseBase {
  Future<void> createList(ListEntry listEntry);

  Future<ListEntry> editList(ListEntry listEntry);

  Future<void> deleteList(int id);
}

@Injectable(as: CreateListUseCaseBase)
class CreateListUseCase implements CreateListUseCaseBase {
  ListRepositoryBase listRepository;

  CreateListUseCase({
    required this.listRepository,
  });

  Future<void> createList(ListEntry listEntry) async {
    return listRepository.addOneList(listEntry.toData());
  }

  @override
  Future<void> deleteList(int id) async {
    return listRepository.deleteList(id);
  }

  @override
  Future<ListEntry> editList(ListEntry listEntry) async {
    await listRepository.editList(listEntry.toData());
    return await listRepository.getById(listEntry.id);
  }
}
