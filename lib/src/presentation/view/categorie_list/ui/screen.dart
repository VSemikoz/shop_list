import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_list/src/common/providers/theme/theme.dart';
import 'package:shop_list/src/presentation/ui/widgets/tappable/common.dart';

import '../../../../../generated/l10n.dart';
import '../../../../domain/models/category.dart';
import '../bloc/categorie_list.dart';

class CategoryListScreen extends StatelessWidget {
  static String id = "category_list";

  const CategoryListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<CategoriesListBloc, CategoriesListState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: Column(
              children: [
                _AppBar(),
                if (state is CategoriesListSuccess)
                  _SuccessScreen(categories: state.categories),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                context.read<CategoriesListBloc>().add(
                      CategoriesListEvent.add(),
                    );
              },
              child: Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: EdgeInsets.all(16),
      color: context.colorTheme.primary.light,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            S.of(context).categoryListScreenAppBar,
            style: context.textStyle.headlineLarge,
          ),
        ],
      ),
    );
  }
}

class _SuccessScreen extends StatelessWidget {
  final List<CategoryEntry> categories;

  const _SuccessScreen({
    Key? key,
    required this.categories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          childAspectRatio: 1.5,
          crossAxisCount: 4,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
          children: categories.map((e) => _CategoryItem(category: e)).toList(),
        ),
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final CategoryEntry category;

  const _CategoryItem({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialTapWrapper(
      radius: Radius.zero,
      onPressed: () => context.read<CategoriesListBloc>().add(
            CategoriesListEvent.edit(category),
          ),
      child: Container(
        height: 20,
        child: Center(child: Text(category.name)),
        color: context.colorTheme.secondary.light,
      ),
    );
  }
}
