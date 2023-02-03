import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_list/src/common/providers/theme/theme.dart';
import 'package:shop_list/src/presentation/view/router/router/bloc.dart';

import '../../../../domain/models/list.dart';
import '../../../../domain/models/product.dart';
import '../../../ui/widgets/tappable/common.dart';
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
        return Scaffold(
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
                    title: _AppBar(list: state.list),
                  ),
                ),
              if (state is ListDetailsSuccess)
                _SuccessScreen(products: state.products),
            ],
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
    return Container(
      color: list.color,
      child: Text(list.name),
    );
  }
}

class _SuccessScreen extends StatelessWidget {
  final List<ProductEntry> products;

  const _SuccessScreen({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => _ProductItem(product: products[index]),
        childCount: products.length,
      ),
    );
  }
}

//TODO into components
class _ProductItem extends StatefulWidget {
  final ProductEntry product;

  const _ProductItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<_ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<_ProductItem> {
  late bool isOpen;

  @override
  void initState() {
    isOpen = false;
    super.initState();
  }

  _changeOpen() {
    setState(() {
      isOpen = !isOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: context.colorTheme.primary.main,
          boxShadow: [
            BoxShadow(
              color: context.colorTheme.background.primary,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MaterialTapWrapper(
              radius: Radius.zero,
              onPressed: () => _changeOpen(),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  _ProductItemTop(product: widget.product),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            if (isOpen) _ProductItemBottom(product: widget.product),
          ],
        ),
      ),
    );
  }
}

class _ProductItemTop extends StatefulWidget {
  final ProductEntry product;

  const _ProductItemTop({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<_ProductItemTop> createState() => _ProductItemTopState();
}

class _ProductItemTopState extends State<_ProductItemTop> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(widget.product.name),
            if (widget.product.isFavorite) _IsFavoriteMarker()
          ],
        ),
        Row(
          children: [
            Text("${widget.product.price}"),
            Text(widget.product.priceDescription),
            const SizedBox(width: 10),
            Text("${widget.product.count}"),
            Text(widget.product.countDescription),
            const SizedBox(width: 10),
            _ProductStatusIcon(status: widget.product.status),
          ],
        ),
      ],
    );
  }
}

class _ProductItemBottom extends StatelessWidget {
  final ProductEntry product;

  const _ProductItemBottom({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: MaterialTapWrapper(
                onPressed: () {
                  context.read<ListDetailsBloc>().add(
                        ListDetailsEvent.deleteProduct(productEntry: product),
                      );
                },
                child: Icon(
                  Icons.delete,
                  color: context.colorTheme.textDark.secondary,
                ),
              ),
            ),
            Expanded(
              child: MaterialTapWrapper(
                onPressed: () {
                  context.read<ListDetailsBloc>().add(
                        ListDetailsEvent.markFavorite(),
                      );
                },
                child: Icon(
                  Icons.star,
                  color: context.colorTheme.secondary.light,
                ),
              ),
            ),
            Expanded(
              child: MaterialTapWrapper(
                onPressed: () => context.read<ListDetailsBloc>().add(
                      ListDetailsEvent.editProduct(productEntry: product),
                    ),
                child: Icon(
                  Icons.edit,
                  color: context.colorTheme.textDark.secondary,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

class _IsFavoriteMarker extends StatelessWidget {
  const _IsFavoriteMarker({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.star,
      color: context.colorTheme.secondary.light,
      size: 10,
    );
  }
}

class _ProductStatusIcon extends StatelessWidget {
  final ProductStatus status;

  const _ProductStatusIcon({
    Key? key,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case ProductStatus.need:
        return _StatusIcon(mainColor: context.colorTheme.error.dark);
      case ProductStatus.ready:
        return _StatusIcon(mainColor: context.colorTheme.success.light);
      case ProductStatus.saved:
      case ProductStatus.none:
        return Container();
    }
  }
}

class _StatusIcon extends StatelessWidget {
  final Color mainColor;

  const _StatusIcon({
    Key? key,
    required this.mainColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        width: 16,
        height: 16,
        color: mainColor,
        child: Icon(
          Icons.check,
          color: context.colorTheme.textLight.primary,
          size: 12,
        ),
      ),
    );
  }
}
