import 'package:flutter/material.dart';

class InfoContainer extends StatelessWidget {
  final String heading;
  final String text;
  final double height;
  final double width;
  final double borderRadius;
  final VoidCallback onTap;
  final String bottomText;

  const InfoContainer({
    super.key,
    required this.heading,
    required this.text,
    this.height = 220,
    this.width = 376,
    this.borderRadius = 20,
    required this.onTap,
    this.bottomText = "Explore More", // default text in bottom-right box
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3), // semi-transparent black
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading
            Text(
              heading,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            // Body text
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  text,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 8),

            // Bottom right small container
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: 27,
                width: 94,
                decoration: BoxDecoration(
                  color: Colors.blueAccent.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: Text(
                  bottomText,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
