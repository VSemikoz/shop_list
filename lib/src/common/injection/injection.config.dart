// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shop_list/src/common/injection/modules.dart' as _i23;
import 'package:shop_list/src/common/providers/localization.dart' as _i7;
import 'package:shop_list/src/common/providers/theme/provider.dart' as _i10;
import 'package:shop_list/src/data/data_sources/local/database/db.dart' as _i8;
import 'package:shop_list/src/data/data_sources/local/localization.dart' as _i6;
import 'package:shop_list/src/data/data_sources/local/theme.dart' as _i9;
import 'package:shop_list/src/data/repository/category.dart' as _i11;
import 'package:shop_list/src/data/repository/list.dart' as _i12;
import 'package:shop_list/src/data/repository/product.dart' as _i13;
import 'package:shop_list/src/domain/usecases/category_edit.dart' as _i14;
import 'package:shop_list/src/domain/usecases/category_list.dart' as _i15;
import 'package:shop_list/src/domain/usecases/create_list.dart' as _i16;
import 'package:shop_list/src/domain/usecases/list_details.dart' as _i17;
import 'package:shop_list/src/domain/usecases/list_of_lists.dart' as _i18;
import 'package:shop_list/src/presentation/view/categorie_list/bloc/bloc.dart'
    as _i19;
import 'package:shop_list/src/presentation/view/category_edit/bloc/bloc.dart'
    as _i20;
import 'package:shop_list/src/presentation/view/create_list/bloc/bloc.dart'
    as _i21;
import 'package:shop_list/src/presentation/view/list_details/bloc/bloc.dart'
    as _i3;
import 'package:shop_list/src/presentation/view/list_of_lists/bloc/bloc.dart'
    as _i22;
import 'package:shop_list/src/presentation/view/router/router/bloc.dart' as _i5;
import 'package:shop_list/src/presentation/view/router/router/providers.dart'
    as _i4;

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
    gh.factoryParam<_i3.ListDetailsBloc, _i4.ListDetailsTransaction,
        _i5.RouterEventSink>((
      transaction,
      router,
    ) =>
        _i3.ListDetailsBloc(
          transaction: transaction,
          router: router,
        ));
    gh.factory<_i6.LocalizationLocalStorage>(
        () => _i6.LocalizationHiveStorage());
    gh.factory<_i7.LocalizationProvider>(() => _i7.LocalizationProvider(
        localizationStorage: gh<_i6.LocalizationLocalStorage>()));
    gh.singleton<_i5.RouterEventSink>(_i5.RouterBloc());
    gh.lazySingleton<_i8.ShopListDataBase>(() => registerModule.dataBase);
    gh.factory<_i9.ThemeLocalStorage>(() => _i9.ThemeHiveStorage());
    gh.factory<_i10.ThemeProvider>(() =>
        _i10.ThemeProvider(themeLocalStorage: gh<_i9.ThemeLocalStorage>()));
    gh.factory<_i11.CategoryRepositoryBase>(() =>
        _i11.CategoryRepositoryImpl(database: gh<_i8.ShopListDataBase>()));
    gh.factory<_i12.ListRepositoryBase>(
        () => _i12.ListRepositoryImpl(database: gh<_i8.ShopListDataBase>()));
    gh.factory<_i13.ProductRepositoryBase>(
        () => _i13.ProductRepository(dataBase: gh<_i8.ShopListDataBase>()));
    gh.factory<_i14.CategoryEditUseCaseBase>(() => _i14.CategoryEditUseCase(
        categoryRepository: gh<_i11.CategoryRepositoryBase>()));
    gh.factory<_i15.CategoryListUseCaseBase>(() => _i15.CategoryListUseCase(
        categoryRepository: gh<_i11.CategoryRepositoryBase>()));
    gh.factory<_i16.CreateListUseCaseBase>(() =>
        _i16.CreateListUseCase(listRepository: gh<_i12.ListRepositoryBase>()));
    gh.factory<_i17.ListDetailsUseCaseBase>(() => _i17.ListDetailsUseCase(
          listRepository: gh<_i12.ListRepositoryBase>(),
          productRepository: gh<_i13.ProductRepositoryBase>(),
        ));
    gh.factory<_i18.ListOfListsUseCaseBase>(() =>
        _i18.ListOfListsUseCase(listRepository: gh<_i12.ListRepositoryBase>()));
    gh.factoryParam<_i19.CategoriesListBloc, _i5.RouterEventSink, dynamic>((
      router,
      _,
    ) =>
        _i19.CategoriesListBloc(
          useCase: gh<_i15.CategoryListUseCaseBase>(),
          router: router,
        ));
    gh.factoryParam<_i20.CategoryEditBloc, _i4.EditCategoryTransaction,
        _i5.RouterEventSink>((
      transaction,
      router,
    ) =>
        _i20.CategoryEditBloc(
          transaction: transaction,
          router: router,
          useCase: gh<_i14.CategoryEditUseCaseBase>(),
        ));
    gh.factoryParam<_i21.CreateListBloc, _i4.CreateListTransaction,
        _i5.RouterEventSink>((
      transaction,
      router,
    ) =>
        _i21.CreateListBloc(
          transaction: transaction,
          router: router,
          useCase: gh<_i16.CreateListUseCaseBase>(),
        ));
    gh.factory<_i22.ListOfListsBloc>(
        () => _i22.ListOfListsBloc(gh<_i18.ListOfListsUseCaseBase>()));
    return this;
  }
}

class _$RegisterModule extends _i23.RegisterModule {}
