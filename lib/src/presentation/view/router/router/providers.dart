import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shop_list/src/common/injection/injection.dart';
import 'package:shop_list/src/domain/models/category.dart';
import 'package:shop_list/src/domain/models/list.dart';
import 'package:shop_list/src/domain/models/product.dart';
import 'package:shop_list/src/presentation/view/categorie_list/bloc/categorie_list.dart';
import 'package:shop_list/src/presentation/view/categorie_list/ui/screen.dart';
import 'package:shop_list/src/presentation/view/category_edit/bloc/category_edit.dart';
import 'package:shop_list/src/presentation/view/edit_list/bloc/edit_list.dart';
import 'package:shop_list/src/presentation/view/edit_list/ui/dialog.dart';
import 'package:shop_list/src/presentation/view/edit_product/screen/edit_product.dart';
import 'package:shop_list/src/presentation/view/list_details/bloc/bloc.dart';
import 'package:shop_list/src/presentation/view/list_details/ui/screen.dart';

import '../../category_edit/screen/dialog.dart';
import '../../edit_product/bloc/edit_product.dart';
import '../../list_details/bloc/event.dart';
import '../../list_of_lists/list_of_lists.dart';
import '../delegate.dart';
import 'bloc.dart';

RouterEventSink getRouter(BuildContext context) =>
    BlocProvider.of<RouterBloc>(context);

class ScreenProvider {
  static RouteInfo listOfLists() => RouteInfo(
        id: ListOfListsScreen.id,
        builder: (context) => Provider(
          create: (_) => getIt<ListOfListsBloc>()..add(ListOfListsEvent.init()),
          child: ListOfListsScreen(),
        ),
      );

  static RouteInfo editList(EditListTransaction transaction) => RouteInfo(
        id: EditListDialog.id,
        pageType: PageType.dialog,
        builder: (context) => Provider(
          create: (_) => getIt<EditListBloc>(
            param1: transaction,
            param2: getRouter(context),
          )..add(EditListEvent.init()),
          child: EditListDialog(),
        ),
      );

  static RouteInfo categoryList() => RouteInfo(
        id: CategoryListScreen.id,
        pageType: PageType.dialog,
        builder: (context) => Provider(
          create: (_) => getIt<CategoriesListBloc>(
            param1: getRouter(context),
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
            param2: getRouter(context),
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
            param2: getRouter(context),
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
            param2: getRouter(context),
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
