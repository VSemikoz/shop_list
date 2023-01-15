import 'package:flutter/material.dart';
import 'package:shop_list/src/common/providers/theme/theme.dart';

const Radius _radius = Radius.circular(400);
const double _opacity = 0.3;

class MaterialTapWrapper extends StatelessWidget {
  final Widget child;
  final Function() onPressed;
  final double? width;
  final double? height;
  final Radius? radius;
  final bool wrapInCenter;
  final bool asOval;

  const MaterialTapWrapper({
    Key? key,
    required this.child,
    required this.onPressed,
    this.width,
    this.height,
    this.radius,
    this.asOval = false,
    this.wrapInCenter = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final button = Stack(
      children: [
        Container(
          height: height,
          width: width,
          child: wrapInCenter ? Center(child: child) : child,
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
                onTap: () => onPressed(),
                highlightColor:
                    context.colorTheme.primary.dark.withOpacity(_opacity),
                splashColor:
                    context.colorTheme.primary.dark.withOpacity(_opacity)),
          ),
        ),
      ],
    );

    return asOval
        ? ClipOval(child: button)
        : ClipRRect(
            child: button,
            borderRadius: BorderRadius.all(radius ?? _radius),
          );
  }
}
