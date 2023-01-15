import 'package:flutter/material.dart';

class TappableText extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final Function() onPressed;

  const TappableText({
    Key? key,
    required this.text,
    this.textStyle,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Text(text, style: textStyle),
      onTap: onPressed,
    );
  }
}
