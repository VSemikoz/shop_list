import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';
import '../../../../domain/models/product.dart';

class NeedReadySaveProductBuilder extends StatelessWidget {
  final List<ProductEntry> saved;
  final List<ProductEntry> ready;
  final List<ProductEntry> need;
  final Widget Function(ProductEntry) productItem;
  final Widget Function(String, ProductStatus) headerItem;

  const NeedReadySaveProductBuilder({
    Key? key,
    required this.saved,
    required this.ready,
    required this.need,
    required this.productItem,
    required this.headerItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          if (need.isNotEmpty)
            headerItem(
              s.commonProductNeed,
              ProductStatus.need,
            ),
          ...need.map((e) => productItem(e)).toList(),
          if (ready.isNotEmpty)
            headerItem(
              s.commonProductReady,
              ProductStatus.ready,
            ),
          ...ready.map((e) => productItem(e)).toList(),
          if (saved.isNotEmpty)
            headerItem(
              s.commonProductSave,
              ProductStatus.saved,
            ),
          ...saved.map((e) => productItem(e)).toList(),
        ],
      ),
    );
  }
}
