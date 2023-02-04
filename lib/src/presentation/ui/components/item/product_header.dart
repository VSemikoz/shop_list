import 'package:flutter/material.dart';
import 'package:shop_list/src/common/providers/theme/theme.dart';

import '../../../../domain/models/product.dart';

class ProductHeader extends StatelessWidget {
  final String text;
  final ProductStatus status;

  const ProductHeader({
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
