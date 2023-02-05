import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

abstract class DataChangeRepositoryBase {
  Stream<int?> get favoriteUpdate;

  void notifyFavorite(int value);

  Stream<int?> get bucketUpdate;

  void notifyBucket(int value);

  close();
}

@Singleton(as: DataChangeRepositoryBase)
class DataChangeRepository implements DataChangeRepositoryBase {
  final BehaviorSubject<int?> _favoriteUpdateController =
      BehaviorSubject.seeded(null);
  final BehaviorSubject<int?> _bucketUpdateController =
      BehaviorSubject.seeded(null);

  Stream<int?> get bucketUpdate {
    return _bucketUpdateController.stream;
  }

  void notifyBucket(int value) {
    return _bucketUpdateController.add(value);
  }

  Stream<int?> get favoriteUpdate {
    return _favoriteUpdateController.stream;
  }

  void notifyFavorite(int value) {
    return _favoriteUpdateController.add(value);
  }

  close() {
    _favoriteUpdateController.close();
    _bucketUpdateController.close();
  }
}
