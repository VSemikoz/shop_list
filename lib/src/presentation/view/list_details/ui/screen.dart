import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_list/src/common/providers/theme/theme.dart';
import 'package:shop_list/src/presentation/view/router/router/bloc.dart';

import '../../../../../generated/l10n.dart';
import '../../../../domain/models/list.dart';
import '../../../../domain/models/product.dart';
import '../../../ui/components/builder/product_list_builder.dart';
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
      productItem: (p) => _ProductItem(product: p),
      headerItem: (value, status) =>
          _ProductHeader(text: value, status: status),
    );
  }
}

class _ProductHeader extends StatelessWidget {
  final String text;
  final ProductStatus status;

  const _ProductHeader({
    Key? key,
    required this.text,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late Color color;
    switch (status) {
      case ProductStatus.need:
        color = context.colorTheme.error.dark;
        break;
      case ProductStatus.ready:
        color = context.colorTheme.success.light;
        break;
      case ProductStatus.saved:
      case ProductStatus.none:
        color = context.colorTheme.background.secondary;
        break;
    }

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          text,
          style: context.textStyle.bodyLarge.copyWith(color: color),
        ),
      ),
    );
  }
}

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
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => _changeOpen(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    _ProductItemTop(product: widget.product),
                    const SizedBox(height: 20),
                  ],
                ),
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
    final s = S.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.product.name),
                    Text(widget.product.description),
                  ],
                ),
              ),
              if (widget.product.isFavorite)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: _IsFavoriteMarker(),
                )
            ],
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${widget.product.price}"),
            const SizedBox(width: 2),
            Text(widget.product.priceDescription),
            const SizedBox(width: 10),
            Text("${widget.product.count}"),
            const SizedBox(width: 2),
            Text(widget.product.countDescription),
            const SizedBox(width: 10),
            Text(
              "${s.editListTotalPrice} ${widget.product.count * widget.product.price}",
            ),
            const SizedBox(width: 2),
            Text(widget.product.priceDescription),
            const SizedBox(width: 10),
            _ProductStatusIcon(
              status: widget.product.status,
              product: widget.product,
            ),
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
                        ListDetailsEvent.markFavorite(productEntry: product),
                      );
                },
                child: Icon(
                  Icons.star,
                  color: product.isFavorite
                      ? context.colorTheme.secondary.light
                      : context.colorTheme.primary.light,
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
      size: 14,
    );
  }
}

class _ProductStatusIcon extends StatelessWidget {
  final ProductStatus status;
  final ProductEntry product;

  const _ProductStatusIcon({
    Key? key,
    required this.status,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Builder(
        builder: (context) {
          switch (status) {
            case ProductStatus.need:
              return _StatusIcon(mainColor: context.colorTheme.error.dark);
            case ProductStatus.ready:
              return _StatusIcon(mainColor: context.colorTheme.success.light);
            case ProductStatus.saved:
            case ProductStatus.none:
              return _StatusIcon(
                mainColor: context.colorTheme.background.primary,
              );
          }
        },
      ),
      onTap: () {
        context.read<ListDetailsBloc>().add(
              ListDetailsEvent.changeProductStatus(productEntry: product),
            );
      },
      onLongPress: () {
        context.read<ListDetailsBloc>().add(
              ListDetailsEvent.changeProductStatus(
                productEntry: product,
                forceSave: true,
              ),
            );
      },
    );
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
