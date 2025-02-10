import 'package:flutter/material.dart';
import 'package:travel_app/Dashboard/Cart/cart.dart';
import 'package:travel_app/Dashboard/Favourite/favourite.dart';
import 'package:travel_app/Dashboard/HomeScreen/homescreencontent.dart';
import 'package:travel_app/Dashboard/Profile/profile_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 0; // Track selected page
  List<Widget> pages = []; // Will be initialized in initState()

  @override
  void initState() {
    super.initState();
    pages = [
      const HomeScreenContent(), // Home content
      const Favourite(), // Favourite Page
      const Cart(), //
      const ProfilePage(), // Profile Page
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: currentPage,
        onTap: (index) {
          setState(() {
            currentPage = index; // Update selected page
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorites'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Profile'),
        ],
      ),
    );
  }
}

// Extracting HomeScreen content into a separate widget
