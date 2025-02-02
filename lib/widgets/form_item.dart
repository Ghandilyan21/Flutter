import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:note_app/style/colors.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FormItem extends StatelessWidget {
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? fillColor;
  final Color? enabledBorderColor;
  final String hintText;
  final Color? textColor;
  final bool obscureText;
  final Map<String, String Function(Object)>? validationMessage;
  final String formControlName;
  final bool readOnly;
  final TextEditingController? controller;
  final int? maxLength;
  final bool isDanse;
  final EdgeInsetsGeometry? contentPadding;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(FormControl<dynamic>)? onTap;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double? hintFontSize;
  final int? minLines;
  final int? maxLines;
  final bool? expand;
  final TextAlignVertical? textAlignVertical;
  const FormItem({
    super.key,
    this.suffixIcon,
    this.textColor,
    this.enabledBorderColor,
    this.fillColor,
    this.validationMessage,
    this.keyboardType,
    this.contentPadding,
    this.prefixIcon,
    this.isDanse = true,
    required this.formControlName,
    required this.hintText,
    this.maxLength,
    this.obscureText = false,
    this.readOnly = false,
    this.controller,
    this.onTap,
    this.inputFormatters,
    this.fontWeight,
    this.fontSize,
    this.hintFontSize,
    this.minLines,
    this.maxLines,
    this.expand,
    this.textAlignVertical,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return ReactiveTextField(
      textAlignVertical: textAlignVertical,
      expands: expand ?? false,
      minLines: minLines,
      maxLines: maxLines,
      controller: controller,
      readOnly: readOnly,
      maxLength: maxLength,
      buildCounter: (context,
              {required currentLength,
              required isFocused,
              required maxLength}) =>
          null,
      formControlName: formControlName,
      inputFormatters: inputFormatters,
      obscureText: obscureText,
      keyboardType: keyboardType,

      style: TextStyle(
        fontSize: fontSize,
        color: textColor,
        fontWeight: fontWeight,
        decoration: TextDecoration.none,
      ),
      onTap: onTap,
      validationMessages: validationMessage,

      decoration: InputDecoration(
        hintStyle: textTheme.headlineSmall?.copyWith(
          fontSize: hintFontSize,
          fontWeight: fontWeight,
          color: AppColors.hint,
        ),
        errorStyle: textTheme.headlineSmall?.copyWith(
          color: Colors.transparent,
        ),
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(vertical: 13, horizontal: 14),

        fillColor: fillColor ?? Colors.transparent,
        filled: true,
        isDense: isDanse,
        border: InputBorder.none,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hintText: hintText,
      ),
    );
  }
}
