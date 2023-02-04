// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shop_list/src/common/injection/modules.dart' as _i28;
import 'package:shop_list/src/common/providers/localization.dart' as _i5;
import 'package:shop_list/src/common/providers/theme/provider.dart' as _i9;
import 'package:shop_list/src/data/data_sources/local/database/db.dart' as _i7;
import 'package:shop_list/src/data/data_sources/local/localization.dart' as _i4;
import 'package:shop_list/src/data/data_sources/local/theme.dart' as _i8;
import 'package:shop_list/src/data/repository/category.dart' as _i10;
import 'package:shop_list/src/data/repository/data_change.dart' as _i3;
import 'package:shop_list/src/data/repository/list.dart' as _i11;
import 'package:shop_list/src/data/repository/product.dart' as _i12;
import 'package:shop_list/src/domain/usecases/category_edit.dart' as _i13;
import 'package:shop_list/src/domain/usecases/category_list.dart' as _i14;
import 'package:shop_list/src/domain/usecases/create_list.dart' as _i15;
import 'package:shop_list/src/domain/usecases/edit_product.dart' as _i18;
import 'package:shop_list/src/domain/usecases/favorite.dart' as _i19;
import 'package:shop_list/src/domain/usecases/list_details.dart' as _i20;
import 'package:shop_list/src/domain/usecases/list_of_lists.dart' as _i21;
import 'package:shop_list/src/presentation/view/category_edit/bloc/bloc.dart'
    as _i23;
import 'package:shop_list/src/presentation/view/category_list/bloc/bloc.dart'
    as _i22;
import 'package:shop_list/src/presentation/view/edit_list/bloc/bloc.dart'
    as _i16;
import 'package:shop_list/src/presentation/view/edit_product/bloc/bloc.dart'
    as _i24;
import 'package:shop_list/src/presentation/view/favorite/bloc/bloc.dart'
    as _i25;
import 'package:shop_list/src/presentation/view/list_details/bloc/bloc.dart'
    as _i26;
import 'package:shop_list/src/presentation/view/list_of_lists/bloc/bloc.dart'
    as _i27;
import 'package:shop_list/src/presentation/view/router/router/bloc.dart' as _i6;
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
    gh.singleton<_i3.DataChangeRepositoryBase>(_i3.DataChangeRepository());
    gh.factory<_i4.LocalizationLocalStorage>(
        () => _i4.LocalizationHiveStorage());
    gh.factory<_i5.LocalizationProvider>(() => _i5.LocalizationProvider(
        localizationStorage: gh<_i4.LocalizationLocalStorage>()));
    gh.singleton<_i6.RouterEventSink>(_i6.RouterBloc());
    gh.lazySingleton<_i7.ShopListDataBase>(() => registerModule.dataBase);
    gh.factory<_i8.ThemeLocalStorage>(() => _i8.ThemeHiveStorage());
    gh.factory<_i9.ThemeProvider>(() =>
        _i9.ThemeProvider(themeLocalStorage: gh<_i8.ThemeLocalStorage>()));
    gh.factory<_i10.CategoryRepositoryBase>(() =>
        _i10.CategoryRepositoryImpl(database: gh<_i7.ShopListDataBase>()));
    gh.factory<_i11.ListRepositoryBase>(
        () => _i11.ListRepositoryImpl(database: gh<_i7.ShopListDataBase>()));
    gh.factory<_i12.ProductRepositoryBase>(
        () => _i12.ProductRepository(dataBase: gh<_i7.ShopListDataBase>()));
    gh.factory<_i13.CategoryEditUseCaseBase>(() => _i13.CategoryEditUseCase(
        categoryRepository: gh<_i10.CategoryRepositoryBase>()));
    gh.factory<_i14.CategoryListUseCaseBase>(() => _i14.CategoryListUseCase(
        categoryRepository: gh<_i10.CategoryRepositoryBase>()));
    gh.factory<_i15.CreateListUseCaseBase>(() =>
        _i15.CreateListUseCase(listRepository: gh<_i11.ListRepositoryBase>()));
    gh.factoryParam<_i16.EditListBloc, _i17.EditListTransaction,
        _i6.RouterEventSink>((
      transaction,
      router,
    ) =>
        _i16.EditListBloc(
          transaction: transaction,
          router: router,
          useCase: gh<_i15.CreateListUseCaseBase>(),
        ));
    gh.factory<_i18.EditProductUseCaseBase>(() => _i18.EditProductUseCase(
          productRepository: gh<_i12.ProductRepositoryBase>(),
          categoryRepository: gh<_i10.CategoryRepositoryBase>(),
          listRepository: gh<_i11.ListRepositoryBase>(),
        ));
    gh.factory<_i19.FavoriteUseCaseBase>(() => _i19.FavoriteUseCase(
          listRepository: gh<_i11.ListRepositoryBase>(),
          productRepository: gh<_i12.ProductRepositoryBase>(),
          dataChangeRepository: gh<_i3.DataChangeRepositoryBase>(),
        ));
    gh.factory<_i20.ListDetailsUseCaseBase>(() => _i20.ListDetailsUseCase(
          listRepository: gh<_i11.ListRepositoryBase>(),
          productRepository: gh<_i12.ProductRepositoryBase>(),
          dataChangeRepository: gh<_i3.DataChangeRepositoryBase>(),
        ));
    gh.factory<_i21.ListOfListsUseCaseBase>(() =>
        _i21.ListOfListsUseCase(listRepository: gh<_i11.ListRepositoryBase>()));
    gh.factoryParam<_i22.CategoriesListBloc, _i6.RouterEventSink, dynamic>((
      router,
      _,
    ) =>
        _i22.CategoriesListBloc(
          useCase: gh<_i14.CategoryListUseCaseBase>(),
          router: router,
        ));
    gh.factoryParam<_i23.CategoryEditBloc, _i17.EditCategoryTransaction,
        _i6.RouterEventSink>((
      transaction,
      router,
    ) =>
        _i23.CategoryEditBloc(
          transaction: transaction,
          router: router,
          useCase: gh<_i13.CategoryEditUseCaseBase>(),
        ));
    gh.factoryParam<_i24.EditProductBloc, _i17.EditProductTransaction,
        _i6.RouterEventSink>((
      transaction,
      router,
    ) =>
        _i24.EditProductBloc(
          transaction,
          router,
          gh<_i18.EditProductUseCaseBase>(),
        ));
    gh.factoryParam<_i25.FavoriteBloc, _i6.RouterEventSink, dynamic>((
      router,
      _,
    ) =>
        _i25.FavoriteBloc(
          router: router,
          useCase: gh<_i19.FavoriteUseCaseBase>(),
        ));
    gh.factoryParam<_i26.ListDetailsBloc, _i17.ListDetailsTransaction,
        _i6.RouterEventSink>((
      transaction,
      router,
    ) =>
        _i26.ListDetailsBloc(
          transaction: transaction,
          router: router,
          useCase: gh<_i20.ListDetailsUseCaseBase>(),
        ));
    gh.factory<_i27.ListOfListsBloc>(
        () => _i27.ListOfListsBloc(gh<_i21.ListOfListsUseCaseBase>()));
    return this;
  }
}

class _$RegisterModule extends _i28.RegisterModule {}
