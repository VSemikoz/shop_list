import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_list/src/presentation/ui/widgets/tappable/common.dart';

import '../../../../../generated/l10n.dart';
import '../../router/router/providers.dart';
import '../bloc/category_edit.dart';

class CategoryEditDialog extends StatelessWidget {
  static String id = "category_edit";

  const CategoryEditDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: BlocBuilder<CategoryEditBloc, CategoryEditState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                TextField(
                  onChanged: (text) {
                    context.read<CategoryEditBloc>().updateText(text);
                  },
                  decoration: InputDecoration(
                    hintText: S.of(context).editCategoryHint,
                  ),
                ),
                _Buttons(),
                const SizedBox(height: 20),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _Buttons extends StatelessWidget {
  const _Buttons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mode = context.read<CategoryEditBloc>().mode;
    switch (mode) {
      case CategoryEditMode.create:
        return _ButtonsAdd();
      case CategoryEditMode.edit:
        return _ButtonsEdit();
    }
  }
}

class _ButtonsAdd extends StatelessWidget {
  const _ButtonsAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MaterialTapWrapper(
          radius: Radius.zero,
          onPressed: () => Navigator.pop(context),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Отменить"),
          ),
        ),
        const SizedBox(width: 20),
        MaterialTapWrapper(
          radius: Radius.zero,
          onPressed: () => context.read<CategoryEditBloc>().add(
                CategoryEditEvent.add(),
              ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Добавить"),
          ),
        ),
      ],
    );
  }
}

class _ButtonsEdit extends StatelessWidget {
  const _ButtonsEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MaterialTapWrapper(
          radius: Radius.zero,
          onPressed: () => Navigator.pop(context),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Отменить"),
          ),
        ),
        const SizedBox(width: 20),
        MaterialTapWrapper(
          radius: Radius.zero,
          onPressed: () => context.read<CategoryEditBloc>().add(
                CategoryEditEvent.edit(),
              ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Изиенить"),
          ),
        ),
        const SizedBox(width: 20),
        MaterialTapWrapper(
          radius: Radius.zero,
          onPressed: () => context.read<CategoryEditBloc>().add(
                CategoryEditEvent.delete(),
              ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Удалить"),
          ),
        ),
      ],
    );
  }
}
