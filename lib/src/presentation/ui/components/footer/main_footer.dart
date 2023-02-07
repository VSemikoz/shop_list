import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_list/src/common/providers/theme/theme.dart';
import 'package:shop_list/src/presentation/ui/widgets/tappable/common.dart';
import 'package:shop_list/src/presentation/view/router/router/bloc.dart';
import 'package:shop_list/src/presentation/view/router/router/event.dart';

import '../../../../common/providers/counter/provider.dart';

class MainFooter extends StatelessWidget {
  final Widget child;

  const MainFooter({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<CounterProvider>();
    return Material(
      child: Column(
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
                  StreamBuilder<int>(
                    stream: provider.getBucketCount(),
                    builder: (context, snapshot) => _Button(
                      counter: snapshot.data,
                      onPressed: () {
                        context.read<RouterBloc>().add(RouterEvent.bucket());
                      },
                      icon: Icons.shopping_cart_rounded,
                    ),
                  ),
                  VerticalDivider(
                    color: context.colorTheme.background.secondary,
                    thickness: 1,
                    width: 1,
                  ),
                  _Button(
                    onPressed: () {
                      context.read<RouterBloc>().add(RouterEvent.listOfLists());
                    },
                    icon: Icons.apps_rounded,
                  ),
                  VerticalDivider(
                    color: context.colorTheme.background.secondary,
                    thickness: 1,
                    width: 1,
                  ),
                  StreamBuilder<int?>(
                    stream: provider.getFavoriteCounter(),
                    builder: (context, snapshot) => _Button(
                      counter: snapshot.data,
                      onPressed: () {
                        context.read<RouterBloc>().add(RouterEvent.favorite());
                      },
                      icon: Icons.star_border,
                    ),
                  ),
                  VerticalDivider(
                    color: context.colorTheme.background.secondary,
                    thickness: 1,
                    width: 1,
                  ),
                  _Button(
                    onPressed: () {
                      context.read<RouterBloc>().add(
                            RouterEvent.categoryList(),
                          );
                    },
                    icon: Icons.list,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Button extends StatelessWidget {
  final Function() onPressed;
  final IconData icon;
  final int? counter;

  const _Button({
    Key? key,
    required this.onPressed,
    required this.icon,
    this.counter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MaterialTapWrapper(
        radius: Radius.zero,
        onPressed: onPressed,
        child: Stack(
          children: [
            Center(child: Icon(icon)),
            if (counter != null && counter != 0)
              Align(
                alignment: Alignment.topRight,
                child: _Counter(counter: counter!),
              ),
          ],
        ),
      ),
    );
  }
}

class _Counter extends StatelessWidget {
  final int counter;

  const _Counter({
    Key? key,
    required this.counter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Align(
        alignment: Alignment.topRight,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.colorTheme.error.dark,
          ),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(
              "$counter",
              style: context.textStyle.bodySmall
                  .copyWith(color: context.colorTheme.textLight.primary),
            ),
          ),
        ),
      ),
    );
  }
}
