import 'package:flutter/material.dart';

class TextDivider extends StatelessWidget {
  final String text;

  const TextDivider({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: Colors.white.withOpacity(0.7), // line color
              thickness: 1,
              endIndent: 10,
            ),
          ),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          Expanded(
            child: Divider(
              color: Colors.white.withOpacity(0.7),
              thickness: 1,
              indent: 10,
            ),
          ),
        ],
      ),
    );
  }
}
