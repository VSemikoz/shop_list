// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shop_list/src/common/injection/modules.dart' as _i31;
import 'package:shop_list/src/common/providers/localization.dart' as _i6;
import 'package:shop_list/src/common/providers/theme/provider.dart' as _i10;
import 'package:shop_list/src/data/data_sources/local/database/db.dart' as _i8;
import 'package:shop_list/src/data/data_sources/local/localization.dart' as _i5;
import 'package:shop_list/src/data/data_sources/local/theme.dart' as _i9;
import 'package:shop_list/src/data/repository/category.dart' as _i11;
import 'package:shop_list/src/data/repository/data_change.dart' as _i3;
import 'package:shop_list/src/data/repository/import_export.dart' as _i4;
import 'package:shop_list/src/data/repository/list.dart' as _i12;
import 'package:shop_list/src/data/repository/product.dart' as _i13;
import 'package:shop_list/src/domain/usecases/bucket.dart' as _i14;
import 'package:shop_list/src/domain/usecases/category_edit.dart' as _i15;
import 'package:shop_list/src/domain/usecases/category_list.dart' as _i16;
import 'package:shop_list/src/domain/usecases/create_list.dart' as _i17;
import 'package:shop_list/src/domain/usecases/edit_product.dart' as _i20;
import 'package:shop_list/src/domain/usecases/favorite.dart' as _i21;
import 'package:shop_list/src/domain/usecases/list_details.dart' as _i22;
import 'package:shop_list/src/domain/usecases/list_of_lists.dart' as _i23;
import 'package:shop_list/src/presentation/view/bucket/bloc/bloc.dart' as _i24;
import 'package:shop_list/src/presentation/view/category_edit/bloc/bloc.dart'
    as _i26;
import 'package:shop_list/src/presentation/view/category_list/bloc/bloc.dart'
    as _i25;
import 'package:shop_list/src/presentation/view/edit_list/bloc/bloc.dart'
    as _i18;
import 'package:shop_list/src/presentation/view/edit_product/bloc/bloc.dart'
    as _i27;
import 'package:shop_list/src/presentation/view/favorite/bloc/bloc.dart'
    as _i28;
import 'package:shop_list/src/presentation/view/list_details/bloc/bloc.dart'
    as _i29;
import 'package:shop_list/src/presentation/view/list_of_lists/bloc/bloc.dart'
    as _i30;
import 'package:shop_list/src/presentation/view/router/router/bloc.dart' as _i7;
import 'package:shop_list/src/presentation/view/router/router/providers.dart'
    as _i19;

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
    gh.factory<_i4.ImportExportDataRepositoryBase>(
        () => _i4.ImportExportDataRepository());
    gh.factory<_i5.LocalizationLocalStorage>(
        () => _i5.LocalizationHiveStorage());
    gh.factory<_i6.LocalizationProvider>(() => _i6.LocalizationProvider(
        localizationStorage: gh<_i5.LocalizationLocalStorage>()));
    gh.singleton<_i7.RouterEventSink>(_i7.RouterBloc());
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
    gh.factory<_i14.BucketUseCaseBase>(() => _i14.BucketUseCase(
          listRepository: gh<_i12.ListRepositoryBase>(),
          productRepository: gh<_i13.ProductRepositoryBase>(),
          dataChangeRepository: gh<_i3.DataChangeRepositoryBase>(),
        ));
    gh.factory<_i15.CategoryEditUseCaseBase>(() => _i15.CategoryEditUseCase(
        categoryRepository: gh<_i11.CategoryRepositoryBase>()));
    gh.factory<_i16.CategoryListUseCaseBase>(() => _i16.CategoryListUseCase(
        categoryRepository: gh<_i11.CategoryRepositoryBase>()));
    gh.factory<_i17.CreateListUseCaseBase>(() =>
        _i17.CreateListUseCase(listRepository: gh<_i12.ListRepositoryBase>()));
    gh.factoryParam<_i18.EditListBloc, _i19.EditListTransaction,
        _i7.RouterEventSink>((
      transaction,
      router,
    ) =>
        _i18.EditListBloc(
          transaction: transaction,
          router: router,
          useCase: gh<_i17.CreateListUseCaseBase>(),
        ));
    gh.factory<_i20.EditProductUseCaseBase>(() => _i20.EditProductUseCase(
          productRepository: gh<_i13.ProductRepositoryBase>(),
          categoryRepository: gh<_i11.CategoryRepositoryBase>(),
          listRepository: gh<_i12.ListRepositoryBase>(),
        ));
    gh.factory<_i21.FavoriteUseCaseBase>(() => _i21.FavoriteUseCase(
          listRepository: gh<_i12.ListRepositoryBase>(),
          productRepository: gh<_i13.ProductRepositoryBase>(),
          dataChangeRepository: gh<_i3.DataChangeRepositoryBase>(),
        ));
    gh.factory<_i22.ListDetailsUseCaseBase>(() => _i22.ListDetailsUseCase(
          listRepository: gh<_i12.ListRepositoryBase>(),
          productRepository: gh<_i13.ProductRepositoryBase>(),
          dataChangeRepository: gh<_i3.DataChangeRepositoryBase>(),
        ));
    gh.factory<_i23.ListOfListsUseCaseBase>(() => _i23.ListOfListsUseCase(
          listRepository: gh<_i12.ListRepositoryBase>(),
          categoryRepository: gh<_i11.CategoryRepositoryBase>(),
          productRepository: gh<_i13.ProductRepositoryBase>(),
          dataChangeRepository: gh<_i3.DataChangeRepositoryBase>(),
          importExportDataRepository: gh<_i4.ImportExportDataRepositoryBase>(),
        ));
    gh.factoryParam<_i24.BucketBloc, _i7.RouterEventSink, dynamic>((
      router,
      _,
    ) =>
        _i24.BucketBloc(
          router: router,
          useCase: gh<_i14.BucketUseCaseBase>(),
        ));
    gh.factoryParam<_i25.CategoriesListBloc, _i7.RouterEventSink, dynamic>((
      router,
      _,
    ) =>
        _i25.CategoriesListBloc(
          useCase: gh<_i16.CategoryListUseCaseBase>(),
          router: router,
        ));
    gh.factoryParam<_i26.CategoryEditBloc, _i19.EditCategoryTransaction,
        _i7.RouterEventSink>((
      transaction,
      router,
    ) =>
        _i26.CategoryEditBloc(
          transaction: transaction,
          router: router,
          useCase: gh<_i15.CategoryEditUseCaseBase>(),
        ));
    gh.factoryParam<_i27.EditProductBloc, _i19.EditProductTransaction,
        _i7.RouterEventSink>((
      transaction,
      router,
    ) =>
        _i27.EditProductBloc(
          transaction,
          router,
          gh<_i20.EditProductUseCaseBase>(),
        ));
    gh.factoryParam<_i28.FavoriteBloc, _i7.RouterEventSink, dynamic>((
      router,
      _,
    ) =>
        _i28.FavoriteBloc(
          router: router,
          useCase: gh<_i21.FavoriteUseCaseBase>(),
        ));
    gh.factoryParam<_i29.ListDetailsBloc, _i19.ListDetailsTransaction,
        _i7.RouterEventSink>((
      transaction,
      router,
    ) =>
        _i29.ListDetailsBloc(
          transaction: transaction,
          router: router,
          useCase: gh<_i22.ListDetailsUseCaseBase>(),
        ));
    gh.factory<_i30.ListOfListsBloc>(
        () => _i30.ListOfListsBloc(gh<_i23.ListOfListsUseCaseBase>()));
    return this;
  }
}

class _$RegisterModule extends _i31.RegisterModule {}
