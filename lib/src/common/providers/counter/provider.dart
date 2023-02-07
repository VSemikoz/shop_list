import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:shop_list/src/data/repository/data_change.dart';

@Injectable()
class CounterProvider extends ChangeNotifier {
  final DataChangeRepositoryBase dataChangeRepository;

  CounterProvider({
    required this.dataChangeRepository,
  });

  Stream<int?> getFavoriteCounter() => dataChangeRepository.favoriteCount;

  Stream<Map<int, int>> getBucketPerListCount() =>
      dataChangeRepository.bucketPerListCount;

  Stream<int> getBucketCount() =>
      dataChangeRepository.bucketPerListCount.map(
        (map) => map.values.fold<int>(0, (prev, curr) => prev + curr),
      );
}
