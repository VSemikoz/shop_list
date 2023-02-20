import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_list/src/common/providers/theme/theme.dart';
import 'package:shop_list/src/presentation/ui/widgets/loading/loading_indicator.dart';
import 'package:shop_list/src/presentation/ui/widgets/tappable/common.dart';
import 'package:shop_list/src/presentation/view/router/router/bloc.dart';

import '../../../../../generated/l10n.dart';
import '../../../../domain/models/list.dart';
import '../../router/router/event.dart';
import '../../router/router/providers.dart';
import '../bloc/list_of_lists.dart';

class ListOfListsScreen extends StatelessWidget {
  static String id = "list_of_lists";

  const ListOfListsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorTheme.background.primary,
      body: BlocBuilder<ListOfListsBloc, ListOfListsState>(
        builder: (context, state) {
          return Column(
            children: [
              _AppBar(
                variant: state is ListOfListsSuccess
                    ? state.variant
                    : ListViewVariant.row,
              ),
              if (state is ListOfListsSuccess)
                _SuccessScreen(
                  variant: state.variant,
                  lists: state.lists,
                ),
              if (state is ListOfListsLoading)
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: AppActivityIndicator(
                          isDark: true,
                        ),
                      ),
                    ],
                  ),
                )
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<RouterBloc>().add(
                RouterEvent.editList(
                  transaction: EditListTransaction(
                    initColor: context.colorThemeRead.picker.list[0],
                    onAddSuccess: () => context.read<ListOfListsBloc>().add(
                          ListOfListsEvent.init(),
                        ),
                    mode: ListEditMode.create,
                    onEditSuccess: () {},
                    onDeleteSuccess: () {},
                  ),
                ),
              );
        },
        backgroundColor: context.colorTheme.primary.light,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  final ListViewVariant variant;

  const _AppBar({
    Key? key,
    required this.variant,
  }) : super(key: key);

  _changeVariant(BuildContext context) {
    switch (variant) {
      case ListViewVariant.row:
        context.read<ListOfListsBloc>().add(
              ListOfListsEvent.changeCurrVariant(
                variant: ListViewVariant.block,
              ),
            );
        break;
      case ListViewVariant.block:
        context.read<ListOfListsBloc>().add(
              ListOfListsEvent.changeCurrVariant(
                variant: ListViewVariant.row,
              ),
            );
        break;
    }
  }

  IconData _getIcon() {
    switch (variant) {
      case ListViewVariant.row:
        return Icons.table_rows;
      case ListViewVariant.block:
        return Icons.grid_view_rounded;
    }
  }

  _export(BuildContext context) {
    context.read<ListOfListsBloc>().add(ListOfListsEvent.export());
  }

  _import(BuildContext context) {
    context.read<ListOfListsBloc>().add(ListOfListsEvent.import());
  }

  _showImportExportDialog(BuildContext context) {
    final s = S.of(context);
    showDialog(
      context: context,
      builder: (_) => Dialog(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),
              Text(s.importExportDialogHeader),
              Text(context.read<ListOfListsBloc>().fullPath ?? ""),
              const SizedBox(height: 20),
              MaterialTapWrapper(
                onPressed: () => _import(context),
                radius: Radius.zero,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(s.importExportDialogImport),
                      Icon(Icons.arrow_downward_sharp, size: 30),
                    ],
                  ),
                ),
              ),
              Divider(),
              MaterialTapWrapper(
                onPressed: () => _export(context),
                radius: Radius.zero,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(s.importExportDialogExport),
                      Icon(Icons.arrow_upward_sharp, size: 30),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: EdgeInsets.all(16),
      color: context.colorTheme.primary.light,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            S.of(context).listOfListsScreenAppBar,
            style: context.textStyle.headlineLarge,
          ),
          MaterialTapWrapper(
            onPressed: () => _showImportExportDialog(context),
            child: Icon(Icons.published_with_changes, size: 30),
          ),
          MaterialTapWrapper(
            onPressed: () => _changeVariant(context),
            child: Icon(_getIcon(), size: 30),
          ),
        ],
      ),
    );
  }
}

class _SuccessScreen extends StatelessWidget {
  final ListViewVariant variant;
  final List<ListEntry> lists;

  const _SuccessScreen({
    Key? key,
    required this.variant,
    required this.lists,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (variant) {
      case ListViewVariant.row:
        return Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: lists.map((e) => _ListItemRow(entry: e)).toList(),
            ),
          ),
        );
      case ListViewVariant.block:
        return Expanded(
          child: GridView.count(
              padding: EdgeInsets.zero,
              crossAxisCount: 2,
              mainAxisSpacing: 0,
              crossAxisSpacing: 0,
              children: lists.map((e) => _ListItemBlock(entry: e)).toList()),
        );
    }
  }
}

class _ListItemRow extends StatelessWidget {
  final ListEntry entry;

  const _ListItemRow({
    Key? key,
    required this.entry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: MaterialTapWrapper(
        radius: Radius.zero,
        onPressed: () {
          context.read<RouterBloc>().add(
                RouterEvent.listDetails(
                  transaction: ListDetailsTransaction(
                    entry: entry,
                    onListUpdate: () => context.read<ListOfListsBloc>().add(
                          ListOfListsEvent.init(),
                        ),
                  ),
                ),
              );
        },
        child: Container(
          height: 60,
          width: double.infinity,
          color: entry.color,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 30,
                width: double.infinity,
                color: context.colorTheme.background.secondary.withOpacity(0.4),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    entry.name,
                    style: context.textStyle.bodyLarge.copyWith(
                      color: context.colorTheme.textLight.primary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ListItemBlock extends StatelessWidget {
  final ListEntry entry;

  const _ListItemBlock({
    Key? key,
    required this.entry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: MaterialTapWrapper(
        radius: Radius.zero,
        onPressed: () {
          context.read<RouterBloc>().add(
                RouterEvent.listDetails(
                  transaction: ListDetailsTransaction(
                    entry: entry,
                    onListUpdate: () => context.read<ListOfListsBloc>().add(
                          ListOfListsEvent.init(),
                        ),
                  ),
                ),
              );
        },
        child: Container(
          width: double.infinity,
          color: entry.color,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 30,
                width: double.infinity,
                color: context.colorTheme.background.secondary.withOpacity(0.4),
                child: Text(
                  entry.name,
                  style: context.textStyle.bodyLarge,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
