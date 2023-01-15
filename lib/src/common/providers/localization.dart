import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:shop_list/src/data/data_sources/local/localization.dart';
import 'package:rxdart/rxdart.dart';

import '../../../generated/l10n.dart';
import '../logger.dart';

const _defaultLocale = LocalizationVariant.ru;

@Injectable()
class LocalizationProvider extends ChangeNotifier {
  final LocalizationLocalStorage localizationStorage;

  LocalizationVariant currentLocalization = _defaultLocale;
  BehaviorSubject<Locale> localeController =
      BehaviorSubject.seeded(_getLocale());

  static Locale _getLocale() => _getLocaleFromVariant(_defaultLocale);

  LocalizationProvider({
    required this.localizationStorage,
  }) {
    _init();
  }

  _init() {
    final localizationFromStore = localizationStorage.localizationVariant;
    if (localizationFromStore == null) {
      //TODO add locale based on current mobile localization
      currentLocalization = _defaultLocale;
      localeController.add(_getLocaleFromVariant(currentLocalization));
      localizationStorage.localizationVariant = currentLocalization;
    } else {
      currentLocalization = localizationFromStore;
      localeController.add(_getLocaleFromVariant(currentLocalization));
    }
  }

  changeLocale(LocalizationVariant localization) {
    localizationStorage.localizationVariant = localization;
    currentLocalization = localization;
    localeController.add(_getLocaleFromVariant(currentLocalization));
    notifyListeners();
  }

  static Locale _getLocaleFromVariant(LocalizationVariant variant) {
    try {
      final code = _getLocalizationNativeCode(variant);
      return S.delegate.supportedLocales.firstWhere(
        (l) => l.languageCode == code,
      );
    } catch (e) {
      Log().writer.log("Can't find locale: $variant");
      return S.delegate.supportedLocales.firstWhere(
        (l) => l.languageCode == 'en',
      );
    }
  }

  static String _getLocalizationNativeCode(LocalizationVariant localization) {
    if (localizationAppToNativeMap.containsKey(localization))
      return localizationAppToNativeMap[localization]!;
    else
      return 'en';
  }
}

const Map<LocalizationVariant, String> localizationAppToNativeMap = {
  LocalizationVariant.en: 'en',
  LocalizationVariant.ru: 'ru',
};
