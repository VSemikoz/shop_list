// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shop_list/src/common/injection/modules.dart' as _i20;
import 'package:shop_list/src/common/providers/localization.dart' as _i4;
import 'package:shop_list/src/common/providers/theme/provider.dart' as _i8;
import 'package:shop_list/src/data/data_sources/local/database/db.dart' as _i6;
import 'package:shop_list/src/data/data_sources/local/localization.dart' as _i3;
import 'package:shop_list/src/data/data_sources/local/theme.dart' as _i7;
import 'package:shop_list/src/data/repository/category.dart' as _i9;
import 'package:shop_list/src/data/repository/list.dart' as _i10;
import 'package:shop_list/src/domain/usecases/category_edit.dart' as _i11;
import 'package:shop_list/src/domain/usecases/category_list.dart' as _i12;
import 'package:shop_list/src/domain/usecases/create_list.dart' as _i13;
import 'package:shop_list/src/domain/usecases/list_of_lists.dart' as _i14;
import 'package:shop_list/src/presentation/view/categorie_list/bloc/bloc.dart'
    as _i15;
import 'package:shop_list/src/presentation/view/category_edit/bloc/bloc.dart'
    as _i16;
import 'package:shop_list/src/presentation/view/create_list/bloc/bloc.dart'
    as _i18;
import 'package:shop_list/src/presentation/view/list_of_lists/bloc/bloc.dart'
    as _i19;
import 'package:shop_list/src/presentation/view/router/router/bloc.dart' as _i5;
import 'package:shop_list/src/presentation/view/router/router/providers.dart'
    as _i17;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i3.LocalizationLocalStorage>(
        () => _i3.LocalizationHiveStorage());
    gh.factory<_i4.LocalizationProvider>(() => _i4.LocalizationProvider(
        localizationStorage: gh<_i3.LocalizationLocalStorage>()));
    gh.singleton<_i5.RouterEventSink>(_i5.RouterBloc());
    gh.lazySingleton<_i6.ShopListDataBase>(() => registerModule.dataBase);
    gh.factory<_i7.ThemeLocalStorage>(() => _i7.ThemeHiveStorage());
    gh.factory<_i8.ThemeProvider>(() =>
        _i8.ThemeProvider(themeLocalStorage: gh<_i7.ThemeLocalStorage>()));
    gh.factory<_i9.CategoryRepositoryBase>(
        () => _i9.CategoryRepositoryImpl(database: gh<_i6.ShopListDataBase>()));
    gh.factory<_i10.ListRepositoryBase>(
        () => _i10.ListRepositoryImpl(database: gh<_i6.ShopListDataBase>()));
    gh.factory<_i11.CategoryEditUseCaseBase>(() => _i11.CategoryEditUseCase(
        categoryRepository: gh<_i9.CategoryRepositoryBase>()));
    gh.factory<_i12.CategoryListUseCaseBase>(() => _i12.CategoryListUseCase(
        categoryRepository: gh<_i9.CategoryRepositoryBase>()));
    gh.factory<_i13.CreateListUseCaseBase>(() =>
        _i13.CreateListUseCase(listRepository: gh<_i10.ListRepositoryBase>()));
    gh.factory<_i14.ListOfListsUseCaseBase>(() =>
        _i14.ListOfListsUseCase(listRepository: gh<_i10.ListRepositoryBase>()));
    gh.factoryParam<_i15.CategoriesListBloc, _i5.RouterEventSink, dynamic>((
      router,
      _,
    ) =>
        _i15.CategoriesListBloc(
          useCase: gh<_i12.CategoryListUseCaseBase>(),
          router: router,
        ));
    gh.factoryParam<_i16.CategoryEditBloc, _i17.EditCategoryTransaction,
        _i5.RouterEventSink>((
      transaction,
      router,
    ) =>
        _i16.CategoryEditBloc(
          transaction: transaction,
          router: router,
          useCase: gh<_i11.CategoryEditUseCaseBase>(),
        ));
    gh.factoryParam<_i18.CreateListBloc, _i17.CreateListTransaction,
        _i5.RouterEventSink>((
      transaction,
      router,
    ) =>
        _i18.CreateListBloc(
          transaction: transaction,
          router: router,
          useCase: gh<_i13.CreateListUseCaseBase>(),
        ));
    gh.factory<_i19.ListOfListsBloc>(
        () => _i19.ListOfListsBloc(gh<_i14.ListOfListsUseCaseBase>()));
    return this;
  }
}

class _$RegisterModule extends _i20.RegisterModule {}
