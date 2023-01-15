import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_list/src/common/providers/theme/theme.dart';

/// App activity indicator
/// Custom material on Android, default on iOS
///
/// Light by default (displays on dark surface)
class AppActivityIndicator extends StatelessWidget {
  final bool isDark;

  const AppActivityIndicator({
    Key? key,
    this.isDark = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? CircularProgressIndicator(
            strokeWidth: 2,
            color: isDark
                ? context.colorTheme.primary.main
                : context.colorTheme.background.primary,
          )
        : Theme(
            data: ThemeData(
              cupertinoOverrideTheme: CupertinoThemeData(
                brightness: isDark ? Brightness.light : Brightness.dark,
              ),
            ),
            child: CupertinoActivityIndicator(),
          );
  }
}
