import 'package:flutter/material.dart';

class InfoImageContainer extends StatelessWidget {
  final String? imageUrl; // fetched from backend
  final String titleText;
  final String subtitleText;
  final double height;
  final double width;
  final double borderRadius;

  // Default asset image
  final String defaultAsset = "assets/images/imagecont.png";

  const InfoImageContainer({
    super.key,
    this.imageUrl,
    required this.titleText,
    required this.subtitleText,
    this.height = 200,
    this.width = 350,
    this.borderRadius = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        image: DecorationImage(
          image: imageUrl != null
              ? NetworkImage(imageUrl!)
              : AssetImage(defaultAsset) as ImageProvider,
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          height: height,
          width: width * 0.4, // 40% width of main container
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(borderRadius),
              bottomRight: Radius.circular(borderRadius),
            ),
          ),
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Top text aligned to left
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  titleText,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              // Bottom text aligned to right
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  subtitleText,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,

                    fontSize: 16,
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
