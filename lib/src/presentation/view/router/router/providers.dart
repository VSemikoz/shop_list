import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../common/injection/injection.dart';
import '../../../../domain/models/category.dart';
import '../../../../domain/models/list.dart';
import '../../../../domain/models/product.dart';
import '../../bucket/bloc/bucket.dart';
import '../../bucket/screen/screen..dart';
import '../../category_edit/bloc/category_edit.dart';
import '../../category_edit/screen/dialog.dart';
import '../../category_list/bloc/category_list.dart';
import '../../category_list/ui/screen.dart';
import '../../edit_list/bloc/edit_list.dart';
import '../../edit_list/ui/dialog.dart';
import '../../edit_product/bloc/edit_product.dart';
import '../../edit_product/screen/edit_product.dart';
import '../../favorite/bloc/favorite.dart';
import '../../favorite/screen/screen.dart';
import '../../list_details/bloc/list_details.dart';
import '../../list_details/ui/screen.dart';
import '../../list_of_lists/list_of_lists.dart';
import '../delegate.dart';
import 'bloc.dart';

RouterEventSink _getRouter(BuildContext context) =>
    BlocProvider.of<RouterBloc>(context);

class ScreenProvider {
  static RouteInfo listOfLists() => RouteInfo(
        id: ListOfListsScreen.id,
        builder: (context) => Provider(
          create: (_) => getIt<ListOfListsBloc>()..add(ListOfListsEvent.init()),
          child: ListOfListsScreen(),
        ),
      );

  static RouteInfo favorite() => RouteInfo(
        id: FavoriteScreen.id,
        builder: (context) => Provider(
          create: (_) => getIt<FavoriteBloc>(
            param1: _getRouter(context),
          )..add(FavoriteEvent.init()),
          child: FavoriteScreen(),
        ),
      );

  static RouteInfo bucket() => RouteInfo(
        id: BucketScreen.id,
        builder: (context) => Provider(
          create: (_) => getIt<BucketBloc>(
            param1: _getRouter(context),
          )..add(BucketEvent.init()),
          child: BucketScreen(),
        ),
      );

  static RouteInfo editList(EditListTransaction transaction) => RouteInfo(
        id: EditListDialog.id,
        pageType: PageType.dialog,
        builder: (context) => Provider(
          create: (_) => getIt<EditListBloc>(
            param1: transaction,
            param2: _getRouter(context),
          )..add(EditListEvent.init()),
          child: EditListDialog(),
        ),
      );

  static RouteInfo categoryList() => RouteInfo(
        id: CategoryListScreen.id,
        pageType: PageType.dialog,
        builder: (context) => Provider(
          create: (_) => getIt<CategoriesListBloc>(
            param1: _getRouter(context),
          )..add(CategoriesListEvent.init()),
          child: CategoryListScreen(),
        ),
      );

  static RouteInfo editCategory(EditCategoryTransaction transaction) =>
      RouteInfo(
        id: CategoryEditDialog.id,
        pageType: PageType.dialog,
        builder: (context) => Provider(
          create: (_) => getIt<CategoryEditBloc>(
            param1: transaction,
            param2: _getRouter(context),
          )..add(CategoryEditEvent.init()),
          child: CategoryEditDialog(),
        ),
      );

  static RouteInfo listDetails(ListDetailsTransaction transaction) => RouteInfo(
        id: ListDetailsScreen.id,
        pageType: PageType.dialog,
        builder: (context) => Provider(
          create: (_) => getIt<ListDetailsBloc>(
            param1: transaction,
            param2: _getRouter(context),
          )..add(ListDetailsEvent.init()),
          child: ListDetailsScreen(),
        ),
      );

  static RouteInfo editProduct(EditProductTransaction transaction) => RouteInfo(
        id: EditProductDialog.id,
        pageType: PageType.dialog,
        builder: (context) => Provider(
          create: (_) => getIt<EditProductBloc>(
            param1: transaction,
            param2: _getRouter(context),
          )..add(EditProductEvent.init()),
          child: EditProductDialog(),
        ),
      );
}

enum ListEditMode {
  create,
  edit,
}

class EditListTransaction {
  final Color initColor;
  final ListEditMode mode;
  final ListEntry? initial;
  final Function() onAddSuccess;
  final Function() onEditSuccess;
  final Function() onDeleteSuccess;

  const EditListTransaction({
    required this.initColor,
    required this.mode,
    this.initial,
    required this.onAddSuccess,
    required this.onEditSuccess,
    required this.onDeleteSuccess,
  });
}

enum CategoryEditMode {
  create,
  edit,
}

class EditCategoryTransaction {
  final CategoryEditMode mode;
  final CategoryEntry? categoryEntry;
  final Function() onSuccess;

  const EditCategoryTransaction({
    required this.mode,
    this.categoryEntry,
    required this.onSuccess,
  });
}

class ListDetailsTransaction {
  final ListEntry entry;

  const ListDetailsTransaction({
    required this.entry,
  });
}

enum EditProductMode {
  add,
  edit,
}

class EditProductTransaction {
  final ProductEntry? entry;
  final EditProductMode mode;
  final ListEntry listEntry;
  final Function()? onAddSuccess;
  final Function()? onDeleteSuccess;
  final Function()? onEditSuccess;

  const EditProductTransaction({
    this.entry,
    this.onAddSuccess,
    this.onDeleteSuccess,
    this.onEditSuccess,
    required this.listEntry,
    required this.mode,
  });
}
