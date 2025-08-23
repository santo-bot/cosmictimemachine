import 'package:flutter/material.dart';

class Confirm_Btn extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed; // for sync
  final Future<void> Function()? onPressedAsync; // for async
  final Color color;
  final Color textColor;
  final double radius;
  final double height;
  final double width;

  const Confirm_Btn({
    super.key,
    required this.text,
    this.onPressed,
    this.onPressedAsync,
    Color? color,
    this.textColor = Colors.white,
    this.radius = 15,
    this.height = 47,
    this.width = 312,
  }) : color = color ?? const Color.fromRGBO(50, 50, 150, 0.6);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          elevation: 4,
        ),
        onPressed: onPressedAsync != null
            ? () async {
          await onPressedAsync!();
        }
            : onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
