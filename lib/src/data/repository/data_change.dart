import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shop_list/src/data/data_sources/local/database/db.dart';

abstract class DataChangeRepositoryBase {
  Stream<int?> get favoriteUpdate;

  void notifyFavorite(int value);

  Stream<int?> get bucketUpdate;

  void notifyBucket(int value);

  void notifyBucketPerListCount();

  Stream<Map<int, int>> get bucketPerListCount;

  void notifyFavoriteCount();

  Stream<int?> get favoriteCount;

  close();
}

@Singleton(as: DataChangeRepositoryBase)
class DataChangeRepository implements DataChangeRepositoryBase {
  final BehaviorSubject<int?> _favoriteUpdateController =
      BehaviorSubject.seeded(null);
  final BehaviorSubject<int?> _bucketUpdateController =
      BehaviorSubject.seeded(null);
  final BehaviorSubject<int?> _favoriteCountController =
      BehaviorSubject.seeded(null);
  final BehaviorSubject<Map<int, int>> _bucketPerListCountController =
      BehaviorSubject.seeded({});

  final ShopListDataBase dataBase;

  DataChangeRepository({
    required this.dataBase,
  }){
    notifyFavoriteCount();
    notifyBucketPerListCount();
  }

  void notifyBucketPerListCount() async {
    final bucket = await dataBase.getReadyOrNeed();
    final Map<int, int> listIdTOCount = {};

    for (var p in bucket) {
      listIdTOCount[p.listId] = listIdTOCount[p.listId] == null
          ? 1
          : listIdTOCount[p.listId] = listIdTOCount[p.listId]! + 1;
    }

    return _bucketPerListCountController.add(listIdTOCount);
  }

  Stream<Map<int, int>> get bucketPerListCount {
    return _bucketPerListCountController.stream;
  }

  void notifyFavoriteCount() async {
    final count = (await dataBase.getFavorite()).length;
    return _favoriteCountController.add(count);
  }

  Stream<int?> get favoriteCount {
    return _favoriteCountController.stream;
  }

  Stream<int?> get bucketUpdate {
    return _bucketUpdateController.stream;
  }

  void notifyBucket(int value) {
    notifyBucketPerListCount();
    return _bucketUpdateController.add(value);
  }

  Stream<int?> get favoriteUpdate {
    return _favoriteUpdateController.stream;
  }

  void notifyFavorite(int value) {
    notifyFavoriteCount();
    return _favoriteUpdateController.add(value);
  }

  close() {
    _favoriteUpdateController.close();
    _bucketUpdateController.close();
    _favoriteCountController.close();
    _bucketPerListCountController.close();
  }
}
