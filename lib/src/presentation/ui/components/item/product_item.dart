import 'package:flutter/material.dart';
import 'package:shop_list/src/common/providers/theme/theme.dart';

import '../../../../../generated/l10n.dart';
import '../../../../domain/models/product.dart';
import '../../widgets/tappable/common.dart';

class ProductItem extends StatefulWidget {
  final Function(ProductEntry) delete;
  final Function(ProductEntry) changeFavorite;
  final Function(ProductEntry) edit;
  final Function(ProductEntry) changeStatus;
  final Function(ProductEntry) changeStatusForceSave;
  final ProductEntry product;

  const ProductItem({
    Key? key,
    required this.product,
    required this.delete,
    required this.changeFavorite,
    required this.edit,
    required this.changeStatus,
    required this.changeStatusForceSave,
  }) : super(key: key);

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
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
                    _ProductItemTop(
                      product: widget.product,
                      changeStatus: widget.changeStatus,
                      changeStatusForceSave: widget.changeStatusForceSave,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            if (isOpen)
              _ProductItemBottom(
                product: widget.product,
                delete: widget.delete,
                changeFavorite: widget.changeFavorite,
                edit: widget.edit,
              ),
          ],
        ),
      ),
    );
  }
}

class _ProductItemTop extends StatefulWidget {
  final ProductEntry product;
  final Function(ProductEntry) changeStatus;
  final Function(ProductEntry) changeStatusForceSave;

  const _ProductItemTop({
    Key? key,
    required this.product,
    required this.changeStatus,
    required this.changeStatusForceSave,
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
              changeStatus: widget.changeStatus,
              changeStatusForceSave: widget.changeStatusForceSave,
            ),
          ],
        ),
      ],
    );
  }
}

class _ProductItemBottom extends StatelessWidget {
  final ProductEntry product;
  final Function(ProductEntry) delete;
  final Function(ProductEntry) changeFavorite;
  final Function(ProductEntry) edit;

  const _ProductItemBottom({
    Key? key,
    required this.product,
    required this.delete,
    required this.changeFavorite,
    required this.edit,
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
                onPressed: () => delete(product),
                child: Icon(
                  Icons.delete,
                  color: context.colorTheme.textDark.secondary,
                ),
              ),
            ),
            Expanded(
              child: MaterialTapWrapper(
                onPressed: () => changeFavorite(product),
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
                onPressed: () => edit(product),
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
  final Function(ProductEntry) changeStatus;
  final Function(ProductEntry) changeStatusForceSave;

  const _ProductStatusIcon({
    Key? key,
    required this.status,
    required this.product,
    required this.changeStatus,
    required this.changeStatusForceSave,
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
      onTap: () => changeStatus(product),
      onLongPress: () => changeStatusForceSave(product),
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
