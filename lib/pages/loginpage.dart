import 'package:cosmictimemachine/constant/TextWidget/CosmicTxt.dart';
import 'package:cosmictimemachine/pages/HomePage.dart';
import 'package:cosmictimemachine/pages/signuppage.dart';
import 'package:cosmictimemachine/snippets/buttons/Login_optn_btn.dart';
import 'package:cosmictimemachine/snippets/buttons/confirm_Btn.dart';
import 'package:cosmictimemachine/snippets/buttons/txtbtn.dart';
import 'package:cosmictimemachine/snippets/txtfields/account_info.dart';
import 'package:cosmictimemachine/snippets/txtfields/txtdivider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _isLoading = false;

  Future<void> loginUser() async {
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill in all fields")),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final response = await http.post(
        Uri.parse('http://192.168.0.102:8000/api/login/'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } else {
        final data = jsonDecode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(data['error'] ?? "Login failed")),
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
                const CustomText(
                  primaryText: "Cosmic",
                  secondaryText: "Time Machine",
                ),
                const SizedBox(height: 200),

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
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TxtButton(text: "Forget Password?", onTap: () {}),
                    ],
                  ),
                ),

                // ✅ Fixed Confirm_Btn for async login
                Confirm_Btn(
                  text: _isLoading ? "Logging in..." : 'Login',
                  onPressedAsync: _isLoading ? null : loginUser,
                ),

                const Text("or", style: TextStyle(fontSize: 15, color: Colors.white)),

                Confirm_Btn(
                  text: 'Continue as guest',
                  onPressedAsync: () async {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                ),

                const SizedBox(height: 50),
                const TextDivider(text: "Login With"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OptnBtn(text: "google", onPressed: () {}),
                    OptnBtn(text: "facebook", onPressed: () {}),
                  ],
                ),
                const SizedBox(height: 20),
                TxtButton(
                  text: "Don't have any account? Sign Up Now!",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
