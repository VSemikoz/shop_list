import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_list/src/common/providers/theme/theme.dart';
import 'package:shop_list/src/presentation/ui/widgets/tappable/common.dart';

import '../../../../../generated/l10n.dart';
import '../bloc/create_list.dart';

class CreateListDialog extends StatelessWidget {
  static String id = "create_list";

  const CreateListDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: BlocBuilder<CreateListBloc, CreateListState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                TextField(
                  onChanged: (text) {
                    context.read<CreateListBloc>().updateText(text);
                  },
                  decoration: InputDecoration(
                    hintText: S.of(context).editCategoryHint,
                  ),
                ),
                const SizedBox(height: 20),
                _ColorPicker(),
                const SizedBox(height: 20),
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

class _ColorPicker extends StatelessWidget {
  const _ColorPicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Color>(
        stream: context.read<CreateListBloc>().currentColorController,
        builder: (context, snapshot) {
          return Row(
            children: context.colorTheme.picker.list
                .map(
                  (e) => _ColorPickerItem(
                    color: e,
                    pickedColor: snapshot.data,
                  ),
                )
                .toList(),
          );
        },);
  }
}

class _ColorPickerItem extends StatelessWidget {
  final Color color;
  final Color? pickedColor;

  const _ColorPickerItem({
    Key? key,
    required this.color,
    this.pickedColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: MaterialTapWrapper(
        radius: Radius.zero,
        onPressed: () {
          context.read<CreateListBloc>().updateColor(color);
        },
        child: Stack(
          children: [
            Container(
              width: 20,
              height: 20,
              color: color,
            ),
            if (pickedColor == color) Icon(Icons.check, size: 20),
          ],
        ),
      ),
    );
  }
}

class _Buttons extends StatelessWidget {
  const _Buttons({Key? key}) : super(key: key);

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
          onPressed: () => context.read<CreateListBloc>().add(
                CreateListEvent.add(),
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
