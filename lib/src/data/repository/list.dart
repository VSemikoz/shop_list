import 'package:injectable/injectable.dart';
import 'package:shop_list/src/data/adapters/list.dart';
import 'package:shop_list/src/data/data_sources/local/database/db.dart';
import 'package:shop_list/src/data/data_sources/local/database/list_table.dart';
import 'package:shop_list/src/data/models/list.dart';
import 'package:shop_list/src/domain/models/list.dart';

abstract class ListRepositoryBase {
  Future<void> addOneList(ListData data);

  Future<List<ListEntry>> getAllLists();

  Future<ListEntry> getById(int id);

  Future<void> editList(ListData list);

  Future<void> deleteList(int id);
}

@Injectable(as: ListRepositoryBase)
class ListRepositoryImpl implements ListRepositoryBase {
  final ShopListDataBase database;

  const ListRepositoryImpl({
    required this.database,
  });

  Future<void> addOneList(ListData data) async =>
      database.insertList(data.toCompanion());

  @override
  Future<List<ListEntry>> getAllLists() async {
    return (await database.getAllLists()).map((e) => e.toEntry()).toList();
  }

  @override
  Future<void> editList(ListData list) {
    return database.editList(list.toUpdateCompanion());
  }

  @override
  Future<ListEntry> getById(int id) async {
    return (await database.getListById(id)).toEntry();
  }

  @override
  Future<void> deleteList(int id) async{
    await database.deleteList(id);
  }
}
