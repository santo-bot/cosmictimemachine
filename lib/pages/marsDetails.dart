import 'package:cosmictimemachine/pages/marsvisit.dart';
import 'package:cosmictimemachine/snippets/buttons/getstartedbtn.dart';
import 'package:cosmictimemachine/snippets/buttons/infocontainer.dart';
import 'package:flutter/material.dart';

import '../snippets/containers/mainbottomnavigationbar.dart';

class MarsDetails extends StatelessWidget {
  const MarsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      bottomNavigationBar: const CustomBottomNav(),

      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/marsbg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            // Scrollable content
            Positioned(
              top: 40,
              left: 16,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_circle_left_rounded, color: Colors.white, size: 35),
              ),
            ),

            Positioned(
              top: 60,
              left: 16,
              right: 16,
              bottom: 100, // leave space for the button
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Small Title Container with Image
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Row(
                            children: [
                              // Mars Image
                              Image.asset(
                                "assets/images/moon.png",
                                height: 24,
                                width: 24,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(width: 8),
                              // Mars Text
                              const Text(
                                "Mars",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Info Containers
                    InfoContainer(
                      heading: "Red Planet",
                      text: """Mars is the fourth planet from the Sun. It is also known as the "Red Planet", because of its orange-red appearance. Mars is a desert-like rocky planet with a tenuous carbon dioxide (CO2) atmosphere. At the average surface level the atmospheric pressure is a few thousandths of Earth's, atmospheric temperature ranges from −153 to 20 °C (−243 to 68 °F) and cosmic radiation is high.""",
                      onTap: () {},
                    ),
                    const SizedBox(height: 20),
                    InfoContainer(
                      heading: "Physical Characteristics",
                      text: """Mars is approximately half the diameter of Earth or twice that of the Moon, with a surface area only slightly less than the total area of Earth's dry land. Mars is less dense than Earth, having about 15% of Earth's volume and 11% of Earth's mass, resulting in about 38% of Earth's surface gravity. Mars is the only presently known example of a desert planet.""",
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),

            // Explore More Button at bottom center
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Startedbtn(
                  text: "Visit",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  MarsVisit(),
                      ),);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
