import 'package:flutter/material.dart';

class TxtButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const TxtButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8), // ripple shape
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.white, // change as you need
          ),
        ),
      ),
    );
  }
}
