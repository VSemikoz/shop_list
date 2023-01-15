import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_list/src/presentation/view/router/utils/modal.dart';

import '../../ui/components/footer/main_footer.dart';
import 'router/router.dart';

class RouterKey {
  static final navKey = GlobalKey<NavigatorState>();
}

class AppRouterDelegate extends RouterDelegate<RouteInfo>
    with PopNavigatorRouterDelegateMixin<RouteInfo>, ChangeNotifier {
  AppRouterDelegate() : navigatorKey = RouterKey.navKey;
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RouterBloc, List<RouteInfo>>(
      buildWhen: (previous, current) =>
          !ListEquality().equals(previous, current),
      builder: (context, stack) {
        if (stack.isEmpty) return Container();

        return MainFooter(
          child: Navigator(
            key: navigatorKey,
            reportsRouteUpdateToEngine: true,
            pages: stack.map((e) => _getPage(context, e)).toList(),
            onPopPage: (route, result) {
              if (!route.didPop(result)) return false;
              context.read<RouterBloc>().add(RouterEvent.pop());
              return true;
            },
          ),
        );
      },
    );
  }

  AppPage _getPage(BuildContext context, RouteInfo routeInfo) {
    return AppPage(
      child: routeInfo.builder(context),
      id: routeInfo.id,
      pageType: routeInfo.pageType,
      key: ValueKey(routeInfo.id),
    );
  }

  @override
  Future<void> setNewRoutePath(RouteInfo configuration) async {}
}

class AppPage<T> extends Page<T> {
  /// The content to be shown in the [Route] created by this page.
  final Widget child;
  final String id;
  final PageType pageType;

  const AppPage({
    required this.child,
    required this.id,
    required this.pageType,
    required ValueKey key,
  }) : super(key: key, name: id);

  @override
  Route<T> createRoute(BuildContext context) {
    final navigator = Navigator.of(context, rootNavigator: true);

    final CapturedThemes theme = InheritedTheme.capture(
      from: context,
      to: navigator.context,
    );

    switch (pageType) {
      case PageType.screen:
        return Platform.isIOS
            ? CupertinoPageRoute(settings: this, builder: (_) => child)
            : MaterialPageRoute(settings: this, builder: (_) => child);
      case PageType.dialog:
        return DialogRoute<T>(
          themes: theme,
          context: context,
          barrierLabel:
              MaterialLocalizations.of(context).modalBarrierDismissLabel,
          settings: this,
          builder: (_) => child,
        );
      case PageType.modal:
        return AppBottomSheetRoute(
          settings: this,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
          ),
          builder: (_) => child,
          isScrollControlled: true,
          capturedThemes: InheritedTheme.capture(
            from: context,
            to: navigator.context,
          ),
        );
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppPage &&
          runtimeType == other.runtimeType &&
          child == other.child &&
          id == other.id &&
          pageType == other.pageType;

  @override
  int get hashCode => child.hashCode ^ id.hashCode ^ pageType.hashCode;
}

class RouteInfo {
  RouteInfo({
    required this.id,
    required this.builder,
    this.pageType = PageType.screen,
  });

  final String id;
  final WidgetBuilder builder;
  final PageType pageType;

  @override
  String toString() {
    return 'Route{id: $id, builder: $builder, pageType: $pageType}';
  }
}

enum PageType {
  screen,
  dialog,
  modal,
}
