import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_list/src/common/providers/theme/provider.dart';

import '../../resource/colors.dart';
import '../../resource/text.dart';

class AppTheme {
  AppTheme({
    required AppTextThemeData Function(AppBaseColors colorTheme)
        createTextTheme,
    required AppBaseColors Function() createColorTheme,
  }) {
    _color = createColorTheme();
    _text = createTextTheme(_color);
  }

  late AppTextThemeData _text;

  AppTextThemeData get text => _text;

  late AppBaseColors _color;

  AppBaseColors get color => _color;

  ThemeData get appThemeData => ThemeData(
        primaryColor: color.background.primary,
        secondaryHeaderColor: color.secondary.main,
        brightness: Brightness.light,
        textSelectionTheme:
            TextSelectionThemeData(cursorColor: color.textDark.secondary),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        pageTransitionsTheme: PageTransitionsTheme(builders: {
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
        }),
        fontFamily: 'Roboto',
      );

  factory AppTheme.lightTheme() => AppTheme(
        createColorTheme: AppBaseColors.getLightColorTheme,
        createTextTheme: _getDefaultTextTheme,
      );
}

AppTextThemeData _getDefaultTextTheme(AppBaseColors color) {
  return const AppTextThemeData(
    headlineLarge: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 32,
      height: 1.25,
    ),
    headlineMedium: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 28,
      height: 1.29,
    ),
    headlineSmall: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 24,
      height: 1.33,
    ),

    ///===================================

    titleLarge: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 24,
      height: 1.27,
    ),
    titleMedium: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 16,
      height: 1.50,
    ),
    titleSmall: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14,
      height: 1.43,
    ),

    ///===================================

    labelLarge: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14,
      height: 1.43,
    ),
    labelMedium: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 12,
      height: 1.33,
    ),
    labelSmall: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 11,
      height: 1.45,
    ),

    ///===================================

    bodyLarge: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16,
      height: 1.50,
    ),
    bodyMedium: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      height: 1.43,
    ),
    bodySmall: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 12,
      height: 1.33,
    ),
  );
}

extension BuildContextExtension on BuildContext {
  AppBaseColors get colorTheme => watch<ThemeProvider>().theme.color;
  AppBaseColors get colorThemeRead => read<ThemeProvider>().theme.color;
  AppTextThemeData get textStyle => watch<ThemeProvider>().theme.text;
}
