import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_list/src/common/providers/theme/theme.dart';
import 'package:shop_list/src/presentation/view/router/router/bloc.dart';

import '../../../../domain/models/list.dart';
import '../../../../domain/models/product.dart';
import '../../../ui/components/builder/product_list_builder.dart';
import '../../../ui/components/item/product_header.dart';
import '../../../ui/components/item/product_item.dart';
import '../../router/router/event.dart';
import '../../router/router/providers.dart';
import '../bloc/list_details.dart';

class ListDetailsScreen extends StatelessWidget {
  static String id = "list_details";

  const ListDetailsScreen({Key? key}) : super(key: key);

  _edit(BuildContext context) {
    context.read<RouterBloc>().add(
          RouterEvent.editList(
            transaction: EditListTransaction(
              initial: context.read<ListDetailsBloc>().list,
              initColor: context.colorThemeRead.picker.list[0],
              mode: ListEditMode.edit,
              onEditSuccess: () {
                context.read<ListDetailsBloc>().add(
                      ListDetailsEvent.onEditListSuccess(),
                    );
              },
              onDeleteSuccess: () {
                context.read<ListDetailsBloc>().add(
                      ListDetailsEvent.onDeleteListSuccess(),
                    );
              },
              onAddSuccess: () {},
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ListDetailsBloc, ListDetailsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return AnnotatedRegion(
          sized: false,
          value: SystemUiOverlayStyle(statusBarColor: state.list.color),
          child: Scaffold(
            backgroundColor: context.colorThemeRead.background.primary,
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () => context.read<ListDetailsBloc>().add(
                    ListDetailsEvent.addProduct(),
                  ),
            ),
            body: CustomScrollView(
              slivers: [
                if (state is ListDetailsSuccess)
                  SliverAppBar(
                    actions: [
                      IconButton(
                        onPressed: () => _edit(context),
                        icon: Icon(Icons.edit),
                      ),
                    ],
                    backgroundColor: state.list.color,
                    floating: true,
                    pinned: true,
                    snap: false,
                    expandedHeight: 80.0,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              state.list.color,
                              Colors.black,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                      title: _AppBar(list: state.list),
                    ),
                  ),
                if (state is ListDetailsSuccess)
                  _SuccessScreen(
                    saved: state.saveProducts,
                    need: state.needProducts,
                    ready: state.readyProducts,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _AppBar extends StatelessWidget {
  final ListEntry list;

  const _AppBar({
    Key? key,
    required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      list.name,
      style: context.textStyle.headlineMedium.copyWith(
        color: context.colorTheme.textLight.primary,
      ),
    );
  }
}

class _SuccessScreen extends StatelessWidget {
  final List<ProductEntry> saved;
  final List<ProductEntry> ready;
  final List<ProductEntry> need;

  const _SuccessScreen({
    Key? key,
    required this.saved,
    required this.ready,
    required this.need,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeedReadySaveProductBuilder(
      need: need,
      saved: saved,
      ready: ready,
      productItem: (p) => ProductItem(
        product: p,
        delete: (p) => context.read<ListDetailsBloc>().add(
              ListDetailsEvent.deleteProduct(productEntry: p),
            ),
        changeFavorite: (p) => context.read<ListDetailsBloc>().add(
              ListDetailsEvent.markFavorite(productEntry: p),
            ),
        edit: (p) => context.read<ListDetailsBloc>().add(
              ListDetailsEvent.editProduct(productEntry: p),
            ),
        changeStatus: (p) => context.read<ListDetailsBloc>().add(
              ListDetailsEvent.changeProductStatus(productEntry: p),
            ),
        changeStatusForceSave: (p) => context.read<ListDetailsBloc>().add(
              ListDetailsEvent.changeProductStatus(
                productEntry: p,
                forceSave: true,
              ),
            ),
      ),
      headerItem: (value, status) => ProductHeader(text: value, status: status),
    );
  }
}
