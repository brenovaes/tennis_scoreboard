import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final Function(String? value)? onSaved;
  final Function(String? value)? onChanged;
  final String? Function(String? value)? validator;
  final bool? emailCheck;
  final String? text;
  final Widget? suffixIcon;
  final TextInputAction? action;
  final TextInputType? type;
  final bool obscure;
  final TextEditingController? controller;
  final TextDirection direction;
  final int? max;
  final InputBorder? border;
  final String? hintText;
  final String? counterText;
  final TextInputType? keyboardType;
  final int? minLines;
  final int? maxLines;
  final String? prefixText;
  final bool autocorrect;
  final String? errorText;
  final List<TextInputFormatter>? inputFormatters;
  final String? initialValue;
  final Widget? prefixIcon;

  const CustomTextFormField({
    Key? key,
    this.prefixIcon,
    this.onSaved,
    this.onChanged,
    this.validator,
    this.emailCheck,
    this.text,
    this.suffixIcon,
    this.action,
    this.type,
    this.obscure = false,
    this.controller,
    this.direction = TextDirection.ltr,
    this.max,
    this.border,
    this.hintText,
    this.counterText,
    this.keyboardType,
    this.minLines,
    this.maxLines,
    this.prefixText,
    this.autocorrect = true,
    this.errorText,
    this.inputFormatters,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      autocorrect: autocorrect,
      maxLength: max,
      textDirection: direction,
      controller: controller,
      obscureText: obscure,
      cursorColor: Colors.black,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        prefixText: prefixText,
        counterText: counterText,
        labelText: text,
        border: border,
        suffixIcon: suffixIcon,
        hintText: hintText,
        errorText: errorText,
        labelStyle: const TextStyle(
          color: Colors.black54,
        ),
      ),
      onChanged: onChanged,
      onSaved: onSaved,
      validator: validator,
      textInputAction: action,
      minLines: minLines,
      maxLines: maxLines,
      inputFormatters: inputFormatters,
    );
  }
}
