import 'package:cosmictimemachine/pages/TimetravelerPage.dart';
import 'package:cosmictimemachine/pages/loginpage.dart';
import 'package:cosmictimemachine/pages/signuppage.dart';
import 'package:cosmictimemachine/snippets/buttons/getstartedbtn.dart';
import 'package:flutter/material.dart';

class GetstartedPage extends StatelessWidget {
  const GetstartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Background Image
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/str_bg.png"),
            fit: BoxFit.cover,
          ),
        ),

        // Transparent overlay for better visibility (optional)
        child: Container(
          color: Colors.black.withOpacity(0.3), // dark overlay
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Title Text

              SizedBox(height: 30),

              // Get Started Button
              Center(
                child: Startedbtn(
                  text: "Get Started",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  LoginPage(),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
