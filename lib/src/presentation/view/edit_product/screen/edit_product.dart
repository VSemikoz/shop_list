import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_list/src/domain/models/list.dart';
import 'package:shop_list/src/presentation/ui/widgets/tappable/common.dart';

import '../../../../../generated/l10n.dart';
import '../../../../domain/models/category.dart';
import '../../router/router/providers.dart';
import '../bloc/edit_product.dart';

class EditProductDialog extends StatelessWidget {
  static String id = "edit_product";

  const EditProductDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: BlocBuilder<EditProductBloc, EditProductState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _NameDescBLock(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: _CategorySelector()),
                      Expanded(child: _ListSelector()),
                    ],
                  ),
                  _CountBloc(),
                  _PriceBlock(),
                  _ButtonsBlock(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _NameDescBLock extends StatefulWidget {
  const _NameDescBLock({Key? key}) : super(key: key);

  @override
  State<_NameDescBLock> createState() => _NameDescBLockState();
}

class _NameDescBLockState extends State<_NameDescBLock> {
  late TextEditingController nameController;
  late TextEditingController descController;

  @override
  void initState() {
    nameController = TextEditingController();
    descController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return BlocListener<EditProductBloc, EditProductState>(
      listener: (context, state) {
        if (state is EditProductInitial) {
          final p = state.product;
          nameController.text = p.name;
          descController.text = p.description;
        }
      },
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(labelText: s.editProductNameHint),
            controller: nameController,
            onChanged: context.read<EditProductBloc>().updateName,
          ),
          TextField(
            decoration: InputDecoration(labelText: s.editProductDescHint),
            controller: descController,
            onChanged: context.read<EditProductBloc>().updateDesc,
          ),
        ],
      ),
    );
  }
}

class _CategorySelector extends StatelessWidget {
  const _CategorySelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    final categories = context.read<EditProductBloc>().categories;
    return StreamBuilder<CategoryEntry?>(
      stream: context.read<EditProductBloc>().categoryController.stream,
      builder: (context, snapshot) => ExpansionTile(
        title: Text(snapshot.data?.name ?? s.editProductCategoryHint),
        children: categories
            .map(
              (e) => _CategorySelectorItem(category: e),
            )
            .toList(),
      ),
    );
  }
}

class _CategorySelectorItem extends StatelessWidget {
  final CategoryEntry category;

  const _CategorySelectorItem({
    Key? key,
    required this.category,
  }) : super(key: key);

  _onPressed(BuildContext context) {
    context.read<EditProductBloc>().updateCategory(category);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialTapWrapper(
      onPressed: () => _onPressed(context),
      child: Text(category.name),
    );
  }
}

class _ListSelector extends StatelessWidget {
  const _ListSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    final lists = context.read<EditProductBloc>().lists;
    return StreamBuilder<ListEntry?>(
      stream: context.read<EditProductBloc>().listController.stream,
      builder: (context, snapshot) => ExpansionTile(
        title: Text(snapshot.data?.name ?? s.editProductListHint),
        children: lists
            .map(
              (e) => _ListSelectorItem(list: e),
            )
            .toList(),
      ),
    );
  }
}

class _ListSelectorItem extends StatelessWidget {
  final ListEntry list;

  const _ListSelectorItem({
    Key? key,
    required this.list,
  }) : super(key: key);

  _onPressed(BuildContext context) {
    context.read<EditProductBloc>().updateList(list);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialTapWrapper(
      onPressed: () => _onPressed(context),
      child: Text(list.name),
    );
  }
}

class _PriceBlock extends StatefulWidget {
  const _PriceBlock({Key? key}) : super(key: key);

  @override
  State<_PriceBlock> createState() => _PriceBlockState();
}

class _PriceBlockState extends State<_PriceBlock> {
  late TextEditingController priceController;
  late TextEditingController totalPriceController;
  late TextEditingController priceDescController;

  @override
  void initState() {
    priceController = TextEditingController();
    totalPriceController = TextEditingController();
    priceDescController = TextEditingController();
    context.read<EditProductBloc>().totalPriceController.listen((value) {
      totalPriceController.text = value?.toString() ?? "";
    });
    priceDescController.text = "₽";
    context.read<EditProductBloc>().updatePriceDesc("₽");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return BlocListener<EditProductBloc, EditProductState>(
      listener: (context, state) {
        if (state is EditProductInitial) {
          final p = state.product;
          priceController.text = p.price.toString();
          totalPriceController.text = (p.price * p.count).toString();
        }
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(labelText: s.editProductPriceHint),
              keyboardType: TextInputType.number,
              controller: priceController,
              onChanged: (value) => context
                  .read<EditProductBloc>()
                  .updatePrice(int.tryParse(value) ?? 0),
            ),
            flex: 2,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: TextField(
              enabled: false,
              decoration: InputDecoration(labelText: s.editProductTotalPriceHint),
              controller: totalPriceController,
              onChanged: (value) => context
                  .read<EditProductBloc>()
                  .updateTotalPrice(int.tryParse(value) ?? 0),
            ),
            flex: 1,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: TextField(
              enabled: false,
              decoration: InputDecoration(labelText: s.editProductPriceDescHint),
              controller: priceDescController,
              onChanged: (value) => context
                  .read<EditProductBloc>()
                  .updateTotalPrice(int.tryParse(value) ?? 0),
            ),
            flex: 1,
          ),
        ],
      ),
    );
  }
}

class _CountBloc extends StatefulWidget {
  const _CountBloc({Key? key}) : super(key: key);

  @override
  State<_CountBloc> createState() => _CountBlocState();
}

class _CountBlocState extends State<_CountBloc> {
  late TextEditingController countController;
  late TextEditingController countDescController;

  @override
  void initState() {
    countController = TextEditingController();
    countDescController = TextEditingController();
    countDescController.text = "шт";
    context.read<EditProductBloc>().updateCountDesc("шт");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return BlocListener<EditProductBloc, EditProductState>(
      listener: (context, state) {
        if (state is EditProductInitial) {
          final p = state.product;
          countController.text = p.count.toString();
          countDescController.text = p.countDescription;
        }
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(labelText: s.editProductCountHint),
              keyboardType: TextInputType.number,
              controller: countController,
              onChanged: (value) => context
                  .read<EditProductBloc>()
                  .updateCount(int.tryParse(value) ?? 0),
            ),
            flex: 2,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: TextField(
              decoration: InputDecoration(labelText: s.editProductCountDescHint),
              controller: countDescController,
              onChanged: context.read<EditProductBloc>().updateCountDesc,
            ),
            flex: 1,
          ),
        ],
      ),
    );
  }
}

class _ButtonsBlock extends StatelessWidget {
  const _ButtonsBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mode = context.read<EditProductBloc>().mode;
    switch (mode) {
      case EditProductMode.add:
        return _AddButtons();
      case EditProductMode.edit:
        return _EditButtons();
    }
  }
}

class _AddButtons extends StatelessWidget {
  const _AddButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MaterialTapWrapper(
          radius: Radius.zero,
          onPressed: () => Navigator.pop(context),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(s.commonCancelButton),
          ),
        ),
        const SizedBox(width: 20),
        MaterialTapWrapper(
          radius: Radius.zero,
          onPressed: () => context.read<EditProductBloc>().add(
                EditProductEvent.add(),
              ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(s.commonAddButton),
          ),
        ),
      ],
    );
  }
}

class _EditButtons extends StatelessWidget {
  const _EditButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MaterialTapWrapper(
          radius: Radius.zero,
          onPressed: () => Navigator.pop(context),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(s.commonCancelButton),
          ),
        ),
        const SizedBox(width: 20),
        MaterialTapWrapper(
          radius: Radius.zero,
          onPressed: () => context.read<EditProductBloc>().add(
                EditProductEvent.edit(),
              ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(s.commonEditButton),
          ),
        ),
        const SizedBox(width: 20),
        MaterialTapWrapper(
          radius: Radius.zero,
          onPressed: () => context.read<EditProductBloc>().add(
                EditProductEvent.delete(),
              ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(s.commonDeleteButton),
          ),
        ),
      ],
    );
  }
}
