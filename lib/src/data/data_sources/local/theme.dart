import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

part 'theme.g.dart';

@HiveType(typeId: 0)
enum ThemeStatus {
  @HiveField(0)
  light,
}

abstract class ThemeLocalStorage {
  late ThemeStatus themeStatus;
}

@Injectable(as: ThemeLocalStorage)
class ThemeHiveStorage implements ThemeLocalStorage {
  static const String boxName = 'theme';

  static Future initHive() async {
    Hive.registerAdapter(ThemeStatusAdapter());
    await Hive.openBox(boxName);
  }

  Box get _hiveBox => Hive.box(boxName);

  ThemeStatus get themeStatus =>
      _hiveBox.get(_Keys.themeStatus.getName()) ?? ThemeStatus.light;

  set themeStatus(ThemeStatus themeStatus) =>
      _hiveBox.put(_Keys.themeStatus.getName(), themeStatus);
}

enum _Keys {
  themeStatus,
}

extension on _Keys {
  String getName() {
    switch (this) {
      case _Keys.themeStatus:
        return "themeStatus";
    }
  }
}
