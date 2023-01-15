import 'package:flutter/material.dart';
import 'package:shop_list/src/common/providers/theme/theme.dart';

import '../widgets.dart';

class RoundButton extends StatelessWidget {
  final Function() onPressed;
  final Color? color;
  final double? radius;
  final double? height;
  final Widget child;
  final Border? border;

  const RoundButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.height,
    this.color,
    this.radius,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialTapWrapper(
      radius: Radius.circular(radius ?? 36),
      height: height ?? 40,
      width: double.infinity,
      onPressed: onPressed,
      child: Container(
        width: double.infinity,
        height: height ?? 40,
        child: Center(child: child),
        decoration: BoxDecoration(
          border: border,
          color: color ?? context.colorTheme.primary.main,
          borderRadius: BorderRadius.circular(radius ?? 36.0),
        ),
      ),
    );
  }
}

class RoundLoadingButton extends StatelessWidget {
  final bool isDark;
  final Color? color;
  final double? radius;
  final double? height;
  final Border? border;

  const RoundLoadingButton({
    Key? key,
    this.color,
    this.radius,
    this.height,
    this.border,
    this.isDark = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundButton(
      onPressed: () {},
      color: color,
      radius: radius,
      height: height,
      border: border,
      child: SizedBox(
        width: 20,
        height: 20,
        child: AppActivityIndicator(isDark: isDark),
      ),
    );
  }
}

class RoundIsLoadingButton extends StatelessWidget {
  final bool isLoading;
  final bool loadingIsDark;
  final Function() onPressed;
  final Color? color;
  final double? radius;
  final double? height;
  final Widget child;
  final Border? border;

  const RoundIsLoadingButton({
    Key? key,
    required this.onPressed,
    this.color,
    this.radius,
    this.height,
    required this.child,
    this.border,
    required this.isLoading,
    this.loadingIsDark = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? RoundLoadingButton(
            isDark: loadingIsDark,
            color: color,
            radius: radius,
            height: height,
            border: border,
          )
        : RoundButton(
            onPressed: onPressed,
            child: child,
            color: color,
            radius: radius,
            height: height,
            border: border,
          );
  }
}
