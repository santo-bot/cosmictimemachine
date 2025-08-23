import 'package:cosmictimemachine/pages/TimetravelerPage.dart';
import 'package:cosmictimemachine/pages/loginpage.dart';
import 'package:cosmictimemachine/pages/marsinfo.dart';
import 'package:cosmictimemachine/pages/signuppage.dart';
import 'package:cosmictimemachine/snippets/buttons/getstartedbtn.dart';
import 'package:cosmictimemachine/snippets/buttons/homecontainer.dart';
import 'package:cosmictimemachine/snippets/buttons/infocontainer.dart';
import 'package:cosmictimemachine/snippets/containers/SpaceExplorerContainer.dart';
import 'package:cosmictimemachine/snippets/containers/TimeTravelerContainer.dart';
import 'package:cosmictimemachine/snippets/containers/mainbottomnavigationbar.dart';
import 'package:flutter/material.dart';

import '../snippets/buttons/imagecontainer.dart';

class JameswebPage extends StatelessWidget {
  const JameswebPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ✅ FIXED BOTTOM NAVIGATION BAR
      bottomNavigationBar: const CustomBottomNav(),

      body: SingleChildScrollView(
        child: Container(
          // Background Image
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/solarsystem.png"),
              fit: BoxFit.cover,
            ),
          ),

          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              color: Colors.black.withOpacity(0.0), // transparent overlay
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),

                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: const [
                            Text(
                              "Welcome...",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 36,
                              ),
                            ),
                            Text(
                              "To James Webb Aura!",
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.normal,
                                fontSize: 30,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 30),

                        TimeTraveler(
                          header: "Time Traveler",
                          body: "Enter details to get image of nearby time ",
                          hint1: "Topic",
                          hint2: "Enter Specific Year",
                          hint3: "Enter Years ago (million/billion)",
                          buttonText: "Find",
                          onPressed: () {},
                          eg: '(You can choose one from below)',
                        ),

                        SizedBox(height: 20),

                        Spaceexplorercontainer(
                          header: "Space Explorer",
                          body: "Enter details to get image of you desire ",
                          eg: "",
                          hint1: "Topic",
                          hint2: "Type",
                          hint3: "Enter Specific Year",
                          buttonText: "Find",
                          onPressed: () {},
                          hint4: 'Sky Coordinates (Optional)',
                          hint5: 'Enter Tag/Keywords (Optional)',
                        ),

                        SizedBox(height: 20),

                        InfoImageContainer(
                          titleText: 'WEBB',
                          subtitleText: 'GALLERY',
                        ),

                        SizedBox(height: 80), // some space above nav bar
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
