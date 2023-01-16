import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'package:shop_list/src/common/injection/injection.dart';
import 'package:shop_list/src/common/providers/localization.dart';
import 'package:shop_list/src/common/providers/theme/provider.dart';
import 'package:shop_list/src/common/providers/theme/theme.dart';
import 'package:shop_list/src/presentation/view/router/delegate.dart';
import 'package:shop_list/src/presentation/view/router/router/bloc.dart';

import 'generated/l10n.dart';

class KubApp extends StatelessWidget {
  const KubApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _AppMultiProvider(
      child: OverlaySupport.global(
        child: Builder(
          builder: (context) {
            _setSystemUIColors(context);
            return StreamBuilder<Locale>(
              stream:
                  context.read<LocalizationProvider>().localeController.stream,
              builder: (context, snapshot) => MaterialApp(
                title: "Kub24",
                theme: AppTheme.lightTheme().appThemeData,
                debugShowCheckedModeBanner: false,
                localizationsDelegates: [
                  GlobalMaterialLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  S.delegate,
                ],
                locale: snapshot.data,
                supportedLocales: S.delegate.supportedLocales,
                home: Router(
                  routerDelegate: AppRouterDelegate(),
                  backButtonDispatcher: RootBackButtonDispatcher(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  _setSystemUIColors(BuildContext context) =>
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          systemNavigationBarColor: context.colorTheme.secondary.light,
          statusBarColor: context.colorTheme.primary.light,
        ),
      );
}

class _AppMultiProvider extends StatelessWidget {
  final Widget child;

  const _AppMultiProvider({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
          create: (_) => getIt<ThemeProvider>(),
        ),
        Provider<RouterBloc>(
          create: (_) => getIt<RouterEventSink>() as RouterBloc,
        ),
        ChangeNotifierProvider<LocalizationProvider>(
          create: (_) => getIt<LocalizationProvider>(),
        ),
      ],
      child: child,
    );
  }
}
