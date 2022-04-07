import 'package:flutter/material.dart';

class CustomRadioButton extends StatelessWidget {
  final String label;
  final int value;
  final void Function(Object?) onChanged;
  final int groupValue;

  const CustomRadioButton({
    Key? key,
    required this.label,
    required this.value,
    required this.onChanged,
    required this.groupValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(label),
        Radio(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
