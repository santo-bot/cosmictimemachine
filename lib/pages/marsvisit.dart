import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../snippets/containers/TimeTravelContainerMars.dart';
import '../snippets/containers/marscontainer.dart';
import '../snippets/containers/mainbottomnavigationbar.dart';

class MarsVisit extends StatefulWidget {
  const MarsVisit({super.key});

  @override
  State<MarsVisit> createState() => _MarsVisitState();
}

class _MarsVisitState extends State<MarsVisit> {
  final TextEditingController yearController = TextEditingController();
  final TextEditingController telescopeController = TextEditingController();

  bool _isLoading = false;
  String? galleryImage; // First image from API

  Future<void> fetchMarsData() async {
    final String year = yearController.text.trim();
    final String telescope = telescopeController.text.trim();

    if (year.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a year")),
      );
      return;
    }

    setState(() => _isLoading = true);

    final Uri url = Uri.parse(
        'http://192.168.0.102:8000/api/nasa/mars-data/?year=$year&telescope=$telescope');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data is List && data.isNotEmpty) {
          // Take the first image from the list
          final firstImage = data[0]['img_src'];
          if (firstImage != null && firstImage is String) {
            setState(() => galleryImage = firstImage);
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("No images found for this year/telescope")),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: ${response.statusCode}")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    yearController.dispose();
    telescopeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            Positioned(
              top: 40,
              left: 16,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_circle_left_rounded,
                  color: Colors.white,
                  size: 35,
                ),
              ),
            ),
            Positioned(
              top: 60,
              left: 16,
              right: 16,
              bottom: 100,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/moon.png",
                                height: 24,
                                width: 24,
                              ),
                              const SizedBox(width: 8),
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
                    MarsCont(
                      topLeftText: "MARS",
                      bottomRightText: "GALLERY",
                      imagePath: galleryImage ?? "assets/images/marscontimage.png",
                      isNetworkImage: galleryImage != null,
                    ),
                    const SizedBox(height: 30),
                    TimeTravelContainerMars(
                      header: "Time Travel",
                      body: "Enter details to get image of nearby time",
                      buttonText: _isLoading ? "Loading..." : "Find",
                      onPressed: fetchMarsData,
                      hint1: 'Enter Specific Year',
                      hint2: 'Enter Telescope',
                      controller1: yearController,
                      controller2: telescopeController,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
