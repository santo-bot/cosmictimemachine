import 'package:flutter/material.dart';
import '../../pages/HomePage.dart';
import '../../pages/favouritePage.dart';
import '../../pages/profile.dart';

class CustomBottomNav extends StatelessWidget {
  final int selectedIndex;

  const CustomBottomNav({super.key, this.selectedIndex = 0});

  void _navigateTo(BuildContext context, int index) {
    Widget page;
    switch (index) {
      case 0:
        page = const HomePage();
        break;
      case 1:
        page = const FavouritePage();
        break;
      case 2:
        page = ProfilePage();
        break;
      default:
        page = const HomePage();
    }

    // Replace current page with new page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: (index) => _navigateTo(context, index),
      backgroundColor: Colors.black,
      selectedItemColor: Colors.orangeAccent,
      unselectedItemColor: Colors.white,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favourite',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}


