import 'package:cosmictimemachine/pages/marsDetails.dart';
import 'package:cosmictimemachine/snippets/buttons/getstartedbtn.dart';
import 'package:flutter/material.dart';

import '../snippets/containers/mainbottomnavigationbar.dart';

class MarsInfoPage extends StatelessWidget {
  const MarsInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final List<Map<String, String>> marsFacts = [
      {
        "image": "assets/images/Weight.png",
        "title": "Mass",
        "body": "(10^23 Kg)",
        "footer": "6.41",
      },
      {
        "image": "assets/images/Magnet Therapy.png",
        "title": "Gravity",
        "body": "(m/s2)",
        "footer": "6.41",
      },
      {
        "image": "assets/images/Sun.png",
        "title": "Day Time",
        "body": "(Hours)",
        "footer": "32",
      },
      {
        "image": "assets/images/Rocket.png",
        "title": "Esc, Velocity",
        "body": "(Km/S)",
        "footer": "21.6",
      },
      {
        "image": "assets/images/Thermometer.png",
        "title": "Mean Temp.",
        "body": "(Degree Celsius)",
        "footer": "15",
      },
      {
        "image": "assets/images/Sun.png",
        "title": "Dis from Sun",
        "body": "(10^6Km)",
        "footer": "21.6",
      },
    ];

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
            // Bottom Container
            Positioned(
              top: 40,
              left: 16,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_circle_left_rounded, color: Colors.white, size: 35),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: screenHeight * 0.7,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const SizedBox(height: 70),
                      const Text(
                        "Mars - The Red Planet",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Grid Section
                      Expanded(
                        child: GridView.builder(
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 0.65,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5,
                          ),
                          itemCount: marsFacts.length,
                          itemBuilder: (context, index) {
                            final fact = marsFacts[index];
                            return Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.08),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12),
                                    ),
                                    child: Image.asset(
                                      fact["image"]!,
                                      height: 46,
                                      width: 45,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    fact["title"]!,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    fact["body"]!,
                                    style: const TextStyle(
                                      fontSize: 10,
                                      color: Colors.white70,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(0.0),
                                    child: Text(
                                      fact["footer"]!,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 60), // Leave space for the button
                    ],
                  ),
                ),
              ),
            ),

            // Explore More Button at bottom center
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Startedbtn(
                  text: "Explore More...",
                  onPressed: () {
Navigator.push(context, MaterialPageRoute(builder: (context)=>MarsDetails()))        ;          },
                ),
              ),
            ),

            // Mars Image Half Inside & Half Outside
            Positioned(
              top: screenHeight * 0.3 - 100,
              left: 0,
              right: 0,
              child: Center(
                child: Image.asset(
                  "assets/images/moon.png",
                  height: 200,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
