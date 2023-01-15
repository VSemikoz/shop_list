import 'package:injectable/injectable.dart';

import '../../data/data_sources/local/database/db.dart';

@module
abstract class RegisterModule {

  @lazySingleton
  ShopListDataBase get dataBase => ShopListDataBase();
}
