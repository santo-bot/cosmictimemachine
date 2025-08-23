import 'package:cosmictimemachine/pages/TimetravelerPage.dart';
import 'package:cosmictimemachine/pages/loginpage.dart';
import 'package:cosmictimemachine/pages/marsinfo.dart';
import 'package:cosmictimemachine/pages/signuppage.dart';
import 'package:cosmictimemachine/snippets/buttons/getstartedbtn.dart';
import 'package:cosmictimemachine/snippets/buttons/homecontainer.dart';
import 'package:cosmictimemachine/snippets/buttons/infocontainer.dart';
import 'package:flutter/material.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Background Image
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/solarsystem.png"),
            fit: BoxFit.cover,

          ),
        ),

        // Transparent overlay for better visibility (optional)
        child: Container(
          color: Colors.black.withOpacity(0.0), // dark overlay
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Title Text


              SizedBox(height: 50),

              // Get Started Button


              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Favourites",style: TextStyle(
                          color: Colors.white,
                        ),),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black, // ✅ black with 50% transparency
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    InfoContainer(onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>MarsInfoPage()));

                    },
                      text: """The solar system is a vast collection of celestial bodies bound together by the Sun's gravity, consisting of the Sun, eight planets, their moons, dwarf planets, asteroids, comets, and interplanetary dust and gas. It formed approximately 4.6 billion years ago from the gravitational collapse of a dense region within a molecular cloud.""",
                      heading: 'SOLAR SYSTEM',),
                    SizedBox(height: 50),

                    InfoContainer(onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>MarsInfoPage()));
                    },
                      text: """Mars is the fourth planet from the Sun. It is also known as the "Red Planet", because of its orange-red appearance.[22][23] Mars is a desert-like rocky planet with a tenuous carbon dioxide (CO2) atmosphere.""",
                      heading: 'Mars',),

                    SizedBox(height: 30),

                    Positioned(
                      bottom: 40,
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context), child: Text("Back",style: TextStyle(color: Colors.blue),),

                      ),
                    ),

                  ],
                ),
              ),





            ],
          ),
        ),
      ),
    );
  }
}
