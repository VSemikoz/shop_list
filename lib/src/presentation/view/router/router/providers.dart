import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shop_list/src/common/injection/injection.dart';
import 'package:shop_list/src/presentation/view/create_list/bloc/bloc.dart';
import 'package:shop_list/src/presentation/view/create_list/bloc/create_list.dart';
import 'package:shop_list/src/presentation/view/create_list/ui/dialog.dart';

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

  static RouteInfo createList(CreateListTransaction transaction) => RouteInfo(
        id: CreateListDialog.id,
        pageType: PageType.dialog,
        builder: (context) => Provider(
          create: (_) => getIt<CreateListBloc>(
            param1: transaction,
            param2: getRouter(context),
          )..add(CreateListEvent.init()),
          child: CreateListDialog(),
        ),
      );
}



class CreateListTransaction{
  final Color initColor;
  final Function() onSuccess;

  const CreateListTransaction({
    required this.initColor,
    required this.onSuccess,
  });
}