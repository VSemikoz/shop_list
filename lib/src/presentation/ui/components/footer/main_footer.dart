import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_list/src/common/providers/theme/theme.dart';
import 'package:shop_list/src/presentation/ui/widgets/tappable/common.dart';
import 'package:shop_list/src/presentation/view/router/router/bloc.dart';
import 'package:shop_list/src/presentation/view/router/router/event.dart';

class MainFooter extends StatelessWidget {
  final Widget child;

  const MainFooter({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: child),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: context.colorTheme.background.primary,
              border: Border(
                top: BorderSide(
                  color: context.colorTheme.background.secondary,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _Button(
                  onPressed: () {
                    context.read<RouterBloc>().add(RouterEvent.bucket());
                  },
                  icon: Icons.shopping_cart_rounded,
                ),
                VerticalDivider(
                  color: context.colorTheme.background.secondary,
                  thickness: 1,                  width: 1,

                ),
                _Button(
                  onPressed: () {
                    context.read<RouterBloc>().add(RouterEvent.listOfLists());
                  },
                  icon: Icons.apps_rounded,
                ),
                VerticalDivider(
                  color: context.colorTheme.background.secondary,
                  thickness: 1,                  width: 1,

                ),
                _Button(
                  onPressed: () {
                    context.read<RouterBloc>().add(RouterEvent.favorite());
                  },
                  icon: Icons.star_border,
                ),
                VerticalDivider(
                  color: context.colorTheme.background.secondary,
                  thickness: 1,
                  width: 1,
                ),
                _Button(
                  onPressed: () {
                    context.read<RouterBloc>().add(RouterEvent.categoryList());
                  },
                  icon: Icons.list,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _Button extends StatelessWidget {
  final Function() onPressed;
  final IconData icon;

  const _Button({
    Key? key,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MaterialTapWrapper(
        radius: Radius.zero,
        onPressed: onPressed,
        child: Icon(icon),
      ),
    );
  }
}
