import 'package:cosmictimemachine/constant/colors/app_colors.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String primaryText;
  final String secondaryText;
  final double primaryFontSize;
  final double secondaryFontSize;
  final Color primaryColor;
  final Color secondaryColor;
  final FontWeight primaryWeight;
  final FontWeight secondaryWeight;

  const CustomText({
    super.key,
    required this.primaryText,
    required this.secondaryText,
    this.primaryFontSize = 45,
    this.secondaryFontSize = 15,
    this.primaryColor = Colors.white,
    this.secondaryColor = AppColors.TimeMachineClr,
    this.primaryWeight = FontWeight.bold,
    this.secondaryWeight = FontWeight.bold,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          primaryText,
          style: TextStyle(
            fontSize: primaryFontSize,
            fontWeight: primaryWeight,
            color: primaryColor,
            height: 0.7, // tight line spacing
          ),
        ),
        Text(
          secondaryText,
          style: TextStyle(
            fontSize: secondaryFontSize,
            fontWeight: secondaryWeight,
            color: secondaryColor,
            height: 1, // tight line spacing
          ),
        ),
      ],
    );
  }
}
