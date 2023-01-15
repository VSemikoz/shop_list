import 'package:injectable/injectable.dart';
import 'package:shop_list/src/data/adapters/list.dart';
import 'package:shop_list/src/data/data_sources/local/database/db.dart';
import 'package:shop_list/src/data/data_sources/local/database/list_table.dart';
import 'package:shop_list/src/data/models/list.dart';
import 'package:shop_list/src/domain/models/list.dart';

abstract class ListRepositoryBase {
  Future<void> addOneList(ListData data);

  Future<List<ListEntry>> getAllLists();
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
}
