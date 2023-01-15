import 'package:injectable/injectable.dart';
import 'package:shop_list/src/data/adapters/list.dart';
import 'package:shop_list/src/data/repository/list.dart';
import 'package:shop_list/src/domain/models/list.dart';

abstract class CreateListUseCaseBase {
  Future<void> createList(ListEntry listEntry);
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
}
