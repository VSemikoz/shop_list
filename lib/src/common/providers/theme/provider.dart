import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shop_list/src/common/providers/theme/theme.dart';

import '../../../data/data_sources/local/theme.dart';

@Injectable()
class ThemeProvider extends ChangeNotifier {
  AppTheme get theme => _theme;

  final ThemeLocalStorage themeLocalStorage;
  ThemeStatus currentTheme = ThemeStatus.light;
  BehaviorSubject<ThemeStatus> themeController =
      BehaviorSubject.seeded(ThemeStatus.light);

  ThemeProvider({
    required this.themeLocalStorage,
  }) {
    _init();
  }

  _init() {
    currentTheme = themeLocalStorage.themeStatus;
    themeController.add(currentTheme);
  }

  AppTheme get _theme {
    switch (currentTheme) {
      case ThemeStatus.light:
        return AppTheme.lightTheme();
    }
  }

  changeTheme(ThemeStatus theme) {
    themeLocalStorage.themeStatus = theme;
    currentTheme = theme;
    themeController.add(currentTheme);
    notifyListeners();
  }

}
