// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shop_list/src/common/injection/modules.dart' as _i25;
import 'package:shop_list/src/common/providers/localization.dart' as _i4;
import 'package:shop_list/src/common/providers/theme/provider.dart' as _i8;
import 'package:shop_list/src/data/data_sources/local/database/db.dart' as _i6;
import 'package:shop_list/src/data/data_sources/local/localization.dart' as _i3;
import 'package:shop_list/src/data/data_sources/local/theme.dart' as _i7;
import 'package:shop_list/src/data/repository/category.dart' as _i9;
import 'package:shop_list/src/data/repository/list.dart' as _i10;
import 'package:shop_list/src/data/repository/product.dart' as _i11;
import 'package:shop_list/src/domain/usecases/category_edit.dart' as _i12;
import 'package:shop_list/src/domain/usecases/category_list.dart' as _i13;
import 'package:shop_list/src/domain/usecases/create_list.dart' as _i14;
import 'package:shop_list/src/domain/usecases/edit_product.dart' as _i17;
import 'package:shop_list/src/domain/usecases/list_details.dart' as _i18;
import 'package:shop_list/src/domain/usecases/list_of_lists.dart' as _i19;
import 'package:shop_list/src/presentation/view/categorie_list/bloc/bloc.dart'
    as _i20;
import 'package:shop_list/src/presentation/view/category_edit/bloc/bloc.dart'
    as _i21;
import 'package:shop_list/src/presentation/view/edit_list/bloc/bloc.dart'
    as _i15;
import 'package:shop_list/src/presentation/view/edit_product/bloc/bloc.dart'
    as _i22;
import 'package:shop_list/src/presentation/view/list_details/bloc/bloc.dart'
    as _i23;
import 'package:shop_list/src/presentation/view/list_of_lists/bloc/bloc.dart'
    as _i24;
import 'package:shop_list/src/presentation/view/router/router/bloc.dart' as _i5;
import 'package:shop_list/src/presentation/view/router/router/providers.dart'
    as _i16;

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
    gh.factory<_i11.ProductRepositoryBase>(
        () => _i11.ProductRepository(dataBase: gh<_i6.ShopListDataBase>()));
    gh.factory<_i12.CategoryEditUseCaseBase>(() => _i12.CategoryEditUseCase(
        categoryRepository: gh<_i9.CategoryRepositoryBase>()));
    gh.factory<_i13.CategoryListUseCaseBase>(() => _i13.CategoryListUseCase(
        categoryRepository: gh<_i9.CategoryRepositoryBase>()));
    gh.factory<_i14.CreateListUseCaseBase>(() =>
        _i14.CreateListUseCase(listRepository: gh<_i10.ListRepositoryBase>()));
    gh.factoryParam<_i15.EditListBloc, _i16.EditListTransaction,
        _i5.RouterEventSink>((
      transaction,
      router,
    ) =>
        _i15.EditListBloc(
          transaction: transaction,
          router: router,
          useCase: gh<_i14.CreateListUseCaseBase>(),
        ));
    gh.factory<_i17.EditProductUseCaseBase>(() => _i17.EditProductUseCase(
          productRepository: gh<_i11.ProductRepositoryBase>(),
          categoryRepository: gh<_i9.CategoryRepositoryBase>(),
          listRepository: gh<_i10.ListRepositoryBase>(),
        ));
    gh.factory<_i18.ListDetailsUseCaseBase>(() => _i18.ListDetailsUseCase(
          listRepository: gh<_i10.ListRepositoryBase>(),
          productRepository: gh<_i11.ProductRepositoryBase>(),
        ));
    gh.factory<_i19.ListOfListsUseCaseBase>(() =>
        _i19.ListOfListsUseCase(listRepository: gh<_i10.ListRepositoryBase>()));
    gh.factoryParam<_i20.CategoriesListBloc, _i5.RouterEventSink, dynamic>((
      router,
      _,
    ) =>
        _i20.CategoriesListBloc(
          useCase: gh<_i13.CategoryListUseCaseBase>(),
          router: router,
        ));
    gh.factoryParam<_i21.CategoryEditBloc, _i16.EditCategoryTransaction,
        _i5.RouterEventSink>((
      transaction,
      router,
    ) =>
        _i21.CategoryEditBloc(
          transaction: transaction,
          router: router,
          useCase: gh<_i12.CategoryEditUseCaseBase>(),
        ));
    gh.factoryParam<_i22.EditProductBloc, _i16.EditProductTransaction,
        _i5.RouterEventSink>((
      transaction,
      router,
    ) =>
        _i22.EditProductBloc(
          transaction,
          router,
          gh<_i17.EditProductUseCaseBase>(),
        ));
    gh.factoryParam<_i23.ListDetailsBloc, _i16.ListDetailsTransaction,
        _i5.RouterEventSink>((
      transaction,
      router,
    ) =>
        _i23.ListDetailsBloc(
          transaction: transaction,
          router: router,
          useCase: gh<_i18.ListDetailsUseCaseBase>(),
        ));
    gh.factory<_i24.ListOfListsBloc>(
        () => _i24.ListOfListsBloc(gh<_i19.ListOfListsUseCaseBase>()));
    return this;
  }
}

class _$RegisterModule extends _i25.RegisterModule {}
