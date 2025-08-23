import 'package:flutter/material.dart';

class AccountTxtField extends StatelessWidget {
  final String hintText;
  final bool isPassword;
  final TextEditingController? controller; // Added controller

  const AccountTxtField({
    super.key,
    required this.hintText,
    this.isPassword = false,
    this.controller, // Optional controller
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 312, // full width
        height: 47,
        child: TextField(
          controller: controller, // assign controller
          obscureText: isPassword,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
            filled: true,
            fillColor: Colors.white.withOpacity(0.1),
            contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.white, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.white, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.white, width: 1),
            ),
          ),
        ),
      ),
    );
  }
}
