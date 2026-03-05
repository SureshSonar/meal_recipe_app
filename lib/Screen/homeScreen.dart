import 'package:flutter/material.dart';
import 'package:meal_recipe_app/Screen/categoryscr.dart';
import 'package:meal_recipe_app/Screen/favouriteScreen.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});
  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  List<Widget> pages = [categoryScreen(), favouriteScreen()];
  int _currindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currindex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currindex = index;
          });
        },
        currentIndex: _currindex,
        backgroundColor: Colors.black54,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorites",
          ),
        ],
      ),
    );
  }
}
