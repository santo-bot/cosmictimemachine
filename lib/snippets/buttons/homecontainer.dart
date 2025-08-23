import 'package:flutter/material.dart';

class homecontainer extends StatelessWidget {
  final String imagePath;
  final String titleText;
  final String subtitleText;
  final double height;
  final double width;
  final double borderRadius;
  final VoidCallback onTap;

  const homecontainer({
    super.key,
    required this.imagePath,   // image is required
    required this.titleText,   // title is required
    required this.subtitleText, // subtitle is required
    this.height = 170,
    this.width = 303,
    this.borderRadius = 20,
    required this.onTap,       // tap action required
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          image: DecorationImage(
            image: AssetImage(imagePath), // ✅ required image
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top left text
              Text(
                titleText,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // Bottom right text
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  subtitleText,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
