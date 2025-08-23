import 'package:cosmictimemachine/pages/JamesWebPage.dart';
import 'package:cosmictimemachine/pages/TimetravelerPage.dart';
import 'package:cosmictimemachine/pages/loginpage.dart';
import 'package:cosmictimemachine/pages/signuppage.dart';
import 'package:cosmictimemachine/pages/solarsystemPage.dart';
import 'package:cosmictimemachine/snippets/buttons/getstartedbtn.dart';
import 'package:cosmictimemachine/snippets/buttons/homecontainer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Background Image
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/homebg.png"),
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
                child: Column(
                  children: [
                    homecontainer(imagePath: 'assets/images/solorsystencont.png', onTap: () {  Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  solarsystemPage(),
                        ),);
                      }, titleText: 'SOLAR', subtitleText: 'SYSTEM',),

                    SizedBox(height: 30),
                    homecontainer(imagePath: 'assets/images/james.png', onTap: () { Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  JameswebPage(),
                      ),);

                      }, titleText: 'JAMES', subtitleText: 'WEBB',),

                    SizedBox(height: 30),
                    homecontainer(imagePath: 'assets/images/humble.png', onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  JameswebPage(),
                        ),);
                    }, titleText: 'HUBBLE', subtitleText: '',),
                    SizedBox(height: 30),
                  ],
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
