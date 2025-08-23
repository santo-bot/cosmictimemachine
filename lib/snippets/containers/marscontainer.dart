import 'package:flutter/material.dart';

class MarsCont extends StatelessWidget {
  final String topLeftText;
  final String bottomRightText;
  final String imagePath;
  final bool isNetworkImage;
  final double height;
  final double width;
  final double borderRadius;

  const MarsCont({
    super.key,
    required this.topLeftText,
    required this.bottomRightText,
    required this.imagePath,
    this.isNetworkImage = false,
    this.height = 180,
    this.width = 300,
    this.borderRadius = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: Colors.black12, // fallback background
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Image
            isNetworkImage
                ? Image.network(
              imagePath,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                // Show fallback if network fails
                return Image.asset(
                  "assets/images/marscontimage.png",
                  fit: BoxFit.cover,
                );
              },
            )
                : Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),

            // Text Overlay
            Positioned(
              top: 30,
              left: 20,
              child: Text(
                topLeftText,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  shadows: [Shadow(blurRadius: 5, color: Colors.black)],
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: Text(
                bottomRightText,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  shadows: [Shadow(blurRadius: 5, color: Colors.black)],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
