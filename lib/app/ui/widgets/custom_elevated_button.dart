import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String? label;
  final Icon? icon;
  final Size? size;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color labelColor;
  final FontWeight labelWeight;

  const CustomElevatedButton({
    Key? key,
    required this.onPressed,
    this.backgroundColor,
    this.label,
    this.size,
    this.icon,
    this.labelColor = Colors.black,
    this.labelWeight = FontWeight.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: label != null
          ? Text(
              label!,
              style: TextStyle(
                color: labelColor,
                fontSize: 20,
                fontWeight: labelWeight,
              ),
            )
          : Center(
              child: icon,
            ),
      style: ElevatedButton.styleFrom(
        primary: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}
