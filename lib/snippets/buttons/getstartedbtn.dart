import 'package:flutter/material.dart';

class Startedbtn extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final double radius;
  final double height;

  const Startedbtn({
    super.key,
    required this.text,
    required this.onPressed,
    Color? color,
    this.textColor = Colors.white,
    this.radius = 15,
    this.height = 57,
  }) : color = color ?? const Color.fromRGBO(0, 100, 150, 0.6);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          elevation: 4,
        ),
        onPressed: onPressed,
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
