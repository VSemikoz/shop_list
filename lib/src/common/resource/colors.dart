import 'package:flutter/material.dart';

class AppBaseColors {
  final MainColorPack primary;
  final MainColorPack secondary;
  final MainColorPack info;
  final MainColorPack success;
  final MainColorPack error;
  final MainColorPack warning;
  final TextColorPack textDark;
  final TextColorPack textLight;
  final BackgroundColorPack background;
  final PickerColors picker;

  static AppBaseColors getLightColorTheme() => AppBaseColors(
        primary: AppLightColors.primary,
        secondary: AppLightColors.secondary,
        info: AppLightColors.info,
        success: AppLightColors.success,
        error: AppLightColors.error,
        warning: AppLightColors.warning,
        textDark: AppLightColors.textDark,
        textLight: AppLightColors.textLight,
        background: AppLightColors.background,
        picker: AppLightColors.pickerVariant,
      );

  const AppBaseColors({
    required this.primary,
    required this.secondary,
    required this.info,
    required this.success,
    required this.error,
    required this.warning,
    required this.textDark,
    required this.textLight,
    required this.background,
    required this.picker,
  });
}

class AppLightColors {
  static const MainColorPack primary = const MainColorPack(
    light: Color(0xFF83CBEA),
    dark: Color(0xFF40ADDC),
    main: Color(0xFF1890C5),
  );
  static const MainColorPack secondary = const MainColorPack(
    light: Color(0xFFC26806),
    dark: Color(0xFF934E04),
    main: Color(0xFFEA7E05),
  );
  static const MainColorPack info = const MainColorPack(
    light: Color(0xFF5999F1),
    dark: Color(0xFF2F80ED),
    main: Color(0xFF2666BE),
  );
  static const MainColorPack success = const MainColorPack(
    light: Color(0xFF52BE80),
    dark: Color(0xFF27AE60),
    main: Color(0xFF1F8B4D),
  );
  static const MainColorPack error = const MainColorPack(
    light: Color(0xFFEF7979),
    dark: Color(0xFFEB5757),
    main: Color(0xFFBC4646),
  );
  static const MainColorPack warning = const MainColorPack(
    light: Color(0xFFF5AD6E),
    dark: Color(0xFFF2994A),
    main: Color(0xFFC27A3B),
  );
  static TextColorPack textDark = const TextColorPack(
    primary: Color(0xDE000000), //87
    secondary: Color(0x99000000), //60
    disable: Color(0x61000000), //38
  );
  static TextColorPack textLight = const TextColorPack(
    primary: Color(0xFFFFFFFF), //87
    secondary: Color(0xAAFFFFFF), //60
    disable: Color(0x33FFFFFF), //38
  );
  static PickerColors pickerVariant = const PickerColors(
    list: [
      Colors.grey,
      Colors.green,
      Colors.blue,
      Colors.orange,
      Colors.purple,
      Colors.pinkAccent,
      Colors.teal,
    ],
  );
  static const BackgroundColorPack background = const BackgroundColorPack(
    primary: Color(0xFFFFFFFF),
    secondary: Color(0x00000000),
  );
}

class MainColorPack {
  final Color light;
  final Color main;
  final Color dark;

  const MainColorPack({
    required this.light,
    required this.main,
    required this.dark,
  });
}

class PickerColors {
  final List<Color> list;

  const PickerColors({
    required this.list,
  });
}

class TextColorPack {
  final Color primary;
  final Color secondary;
  final Color disable;

  const TextColorPack({
    required this.primary,
    required this.secondary,
    required this.disable,
  });
}

class BackgroundColorPack {
  final Color primary;
  final Color secondary;

  const BackgroundColorPack({
    required this.primary,
    required this.secondary,
  });
}
