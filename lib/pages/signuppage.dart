import 'package:cosmictimemachine/constant/TextWidget/signuptxt.dart';
import 'package:cosmictimemachine/pages/HomePage.dart';
import 'package:cosmictimemachine/snippets/buttons/Login_optn_btn.dart';
import 'package:cosmictimemachine/snippets/buttons/confirm_Btn.dart';
import 'package:cosmictimemachine/snippets/buttons/txtbtn.dart';
import 'package:cosmictimemachine/snippets/txtfields/account_info.dart';
import 'package:cosmictimemachine/snippets/txtfields/txtdivider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool _isLoading = false;

  Future<void> signUpUser() async {
    final String name = nameController.text.trim();
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();
    final String confirmPassword = confirmPasswordController.text.trim();

    if (name.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill in all fields")),
      );
      return;
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Passwords do not match")),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final response = await http.post(
        Uri.parse('http://192.168.0.102:8000/api/signup/'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': name,
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 201) {
        // Signup successful, navigate to HomePage
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } else {
        final data = jsonDecode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(data['error'] ?? "Sign up failed")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/login_bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                const SignUpTxt(
                  primaryText: "Create Account",
                  secondaryText: "To get started now!",
                ),
                const SizedBox(height: 150),

                AccountTxtField(
                  hintText: "Enter your name",
                  controller: nameController,
                ),
                const SizedBox(height: 15),
                AccountTxtField(
                  hintText: "Email address",
                  controller: emailController,
                ),
                const SizedBox(height: 15),
                AccountTxtField(
                  hintText: "Password",
                  isPassword: true,
                  controller: passwordController,
                ),
                const SizedBox(height: 15),
                AccountTxtField(
                  hintText: "Confirm Password",
                  isPassword: true,
                  controller: confirmPasswordController,
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TxtButton(text: "Forget Password?", onTap: () {}),
                    ],
                  ),
                ),

                Confirm_Btn(
                  text: _isLoading ? "Signing up..." : 'Sign Up',
                  onPressedAsync: _isLoading ? null : signUpUser,
                ),

                const SizedBox(height: 50),
                const TextDivider(text: "Sign Up With"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OptnBtn(text: "google", onPressed: () {}),
                    OptnBtn(text: "facebook", onPressed: () {}),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
