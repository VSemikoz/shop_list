// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Lists`
  String get listOfListsScreenAppBar {
    return Intl.message(
      'Lists',
      name: 'listOfListsScreenAppBar',
      desc: '',
      args: [],
    );
  }

  /// `List`
  String get createListScreenHint {
    return Intl.message(
      'List',
      name: 'createListScreenHint',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categoryListScreenAppBar {
    return Intl.message(
      'Categories',
      name: 'categoryListScreenAppBar',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get editCategoryHint {
    return Intl.message(
      'Category',
      name: 'editCategoryHint',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get editListTotalPrice {
    return Intl.message(
      'Total',
      name: 'editListTotalPrice',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get editProductNameHint {
    return Intl.message(
      'Name',
      name: 'editProductNameHint',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get editProductDescHint {
    return Intl.message(
      'Description',
      name: 'editProductDescHint',
      desc: '',
      args: [],
    );
  }

  /// `Select category`
  String get editProductCategoryHint {
    return Intl.message(
      'Select category',
      name: 'editProductCategoryHint',
      desc: '',
      args: [],
    );
  }

  /// `Select list`
  String get editProductListHint {
    return Intl.message(
      'Select list',
      name: 'editProductListHint',
      desc: '',
      args: [],
    );
  }

  /// `Count`
  String get editProductCountHint {
    return Intl.message(
      'Count',
      name: 'editProductCountHint',
      desc: '',
      args: [],
    );
  }

  /// `Count unit`
  String get editProductCountDescHint {
    return Intl.message(
      'Count unit',
      name: 'editProductCountDescHint',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get editProductPriceHint {
    return Intl.message(
      'Price',
      name: 'editProductPriceHint',
      desc: '',
      args: [],
    );
  }

  /// `Total price`
  String get editProductTotalPriceHint {
    return Intl.message(
      'Total price',
      name: 'editProductTotalPriceHint',
      desc: '',
      args: [],
    );
  }

  /// `Price unit`
  String get editProductPriceDescHint {
    return Intl.message(
      'Price unit',
      name: 'editProductPriceDescHint',
      desc: '',
      args: [],
    );
  }

  /// `Favorite`
  String get favoriteScreenAppBar {
    return Intl.message(
      'Favorite',
      name: 'favoriteScreenAppBar',
      desc: '',
      args: [],
    );
  }

  /// `Bucket`
  String get bucketScreenAppBar {
    return Intl.message(
      'Bucket',
      name: 'bucketScreenAppBar',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get commonAddButton {
    return Intl.message(
      'Add',
      name: 'commonAddButton',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get commonCancelButton {
    return Intl.message(
      'Cancel',
      name: 'commonCancelButton',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get commonEditButton {
    return Intl.message(
      'Edit',
      name: 'commonEditButton',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get commonDeleteButton {
    return Intl.message(
      'Delete',
      name: 'commonDeleteButton',
      desc: '',
      args: [],
    );
  }

  /// `Ready`
  String get commonProductReady {
    return Intl.message(
      'Ready',
      name: 'commonProductReady',
      desc: '',
      args: [],
    );
  }

  /// `Need`
  String get commonProductNeed {
    return Intl.message(
      'Need',
      name: 'commonProductNeed',
      desc: '',
      args: [],
    );
  }

  /// `Saved`
  String get commonProductSave {
    return Intl.message(
      'Saved',
      name: 'commonProductSave',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
