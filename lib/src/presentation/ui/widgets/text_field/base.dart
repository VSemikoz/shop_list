import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_list/src/common/providers/theme/theme.dart';

class BaseTextField extends StatelessWidget {
  final String hint;
  final String? errorText;
  final TextStyle? errorStyle;
  final TextStyle? hintStyle;
  final TextEditingController controller;
  final TextAlign? textAlign;
  final Color? cursorColor;
  final TextStyle? style;
  final InputBorder? border;
  final InputBorder? disabledBorder;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final Function(String)? onSubmitted;
  final Function(String)? onChanged;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;

  const BaseTextField({
    Key? key,
    required this.hint,
    required this.controller,
    this.textAlign,
    this.cursorColor,
    this.style,
    this.border,
    this.hintStyle,
    this.disabledBorder,
    this.enabledBorder,
    this.focusedBorder,
    this.onSubmitted,
    this.onChanged,
    this.focusNode,
    this.errorText,
    this.errorStyle,
    this.inputFormatters,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return TextField(
      inputFormatters: inputFormatters,
      onSubmitted: onSubmitted,
      onChanged: onChanged,
      controller: controller,
      focusNode: focusNode,
      textAlign: textAlign ?? TextAlign.left,
      cursorColor: cursorColor ?? context.colorTheme.background.primary,
      style: style ??
          context.textStyle.bodyLarge.copyWith(
            color: context.colorTheme.background.primary,
          ),
      decoration: InputDecoration(
        errorText: errorText,
        errorMaxLines: 2,
        errorStyle: errorStyle,
        border: border,
        disabledBorder: disabledBorder,
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,
        hintStyle: hintStyle ??
            context.textStyle.bodyLarge.copyWith(
              color: context.colorTheme.background.primary,
            ),
        hintText: hint,
      ),
    );
  }
}
