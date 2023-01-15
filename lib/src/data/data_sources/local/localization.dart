import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

part 'localization.g.dart';

@HiveType(typeId: 2)
enum LocalizationVariant {
  @HiveField(0)
  en,
  @HiveField(1)
  ru,
}

///Contain user authorization info
///[accessToken] - token received from back
///[companyId] - company id received from back
abstract class LocalizationLocalStorage {
  LocalizationVariant? localizationVariant;
}

@Injectable(as: LocalizationLocalStorage)
class LocalizationHiveStorage implements LocalizationLocalStorage {
  static const String boxName = 'localization';

  static Future initHive() async {
    Hive.registerAdapter(LocalizationVariantAdapter());
    await Hive.openBox(boxName);
  }

  Box get _hiveBox => Hive.box(boxName);

  LocalizationVariant? get localizationVariant =>
      _hiveBox.get(_Keys.localizationVariant.getName());

  set localizationVariant(LocalizationVariant? localization) =>
      _hiveBox.put(_Keys.localizationVariant.getName(), localization);
}

enum _Keys {
  localizationVariant,
}

extension on _Keys {
  String getName() {
    switch (this) {
      case _Keys.localizationVariant:
        return "localizationVariant";
    }
  }
}
