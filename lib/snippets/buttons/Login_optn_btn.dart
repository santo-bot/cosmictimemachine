import 'package:flutter/material.dart';

import '../../constant/colors/app_colors.dart';

class OptnBtn extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color textColor;
  final double radius;
  final double height;
  final double width;

  const OptnBtn({
    super.key,
    required this.text,
    required this.onPressed,
    this.textColor = Colors.white,
    this.radius = 15,
    this.height = 51,
    this.width = 157,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: AppColors.purpleToBlueGradient, // <-- use gradient from AppColors
          borderRadius: BorderRadius.circular(radius),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: const Offset(0, 3),
              blurRadius: 4,
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent, // transparent button
            shadowColor: Colors.transparent, // remove default shadow
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
