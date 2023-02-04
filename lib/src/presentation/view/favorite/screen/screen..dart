import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_list/src/common/providers/theme/theme.dart';
import 'package:shop_list/src/presentation/view/favorite/bloc/favorite.dart';

import '../../../../domain/models/product.dart';
import '../../../ui/components/builder/product_list_builder.dart';
import '../../../ui/components/item/product_item.dart';
import '../../../ui/components/item/product_header.dart';

class FavoriteScreen extends StatelessWidget {
  static String id = "favorite";

  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteBloc, FavoriteState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: context.colorThemeRead.background.primary,
          body: CustomScrollView(
            slivers: [
              if (state is FavoriteSuccess)
                SliverAppBar(
                  backgroundColor: context.colorTheme.primary.light,
                  floating: true,
                  pinned: true,
                  snap: false,
                  expandedHeight: 80.0,
                  flexibleSpace: FlexibleSpaceBar(
                    title: _AppBar(),
                  ),
                ),
              if (state is FavoriteSuccess)
                _SuccessScreen(
                  saved: state.saveProducts,
                  need: state.needProducts,
                  ready: state.readyProducts,
                ),
            ],
          ),
        );
      },
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Favorite",
      style: context.textStyle.headlineMedium,
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
        delete: (p) => context.read<FavoriteBloc>().add(
              FavoriteEvent.deleteProduct(productEntry: p),
            ),
        changeFavorite: (p) => context.read<FavoriteBloc>().add(
              FavoriteEvent.markFavorite(productEntry: p),
            ),
        edit: (p) => context.read<FavoriteBloc>().add(
              FavoriteEvent.editProduct(productEntry: p),
            ),
        changeStatus: (p) => context.read<FavoriteBloc>().add(
              FavoriteEvent.changeProductStatus(productEntry: p),
            ),
        changeStatusForceSave: (p) => context.read<FavoriteBloc>().add(
              FavoriteEvent.changeProductStatus(
                productEntry: p,
                forceSave: true,
              ),
            ),
      ),
      headerItem: (value, status) => ProductHeader(text: value, status: status),
    );
  }
}
