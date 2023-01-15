import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shop_list/src/data/data_sources/local/localization.dart';
import 'package:shop_list/src/data/data_sources/local/theme.dart';

import 'app.dart';
import 'src/common/injection/injection.dart';
import 'src/common/logger.dart';

void main() => setupApp().then((value) => runApp(KubApp()));

Future<void> setupApp() async {
  await Hive.initFlutter();
  await Future.wait([
    ThemeHiveStorage.initHive(),
    LocalizationHiveStorage.initHive(),
  ]);

  _disableLandscape();

  Log().writer = kReleaseMode ? LogWriterProduction() : LogWriterDevelopment();
  await configureInjection(Env.dev);
}

void _disableLandscape() => SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    );
