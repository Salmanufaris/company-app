import 'package:app/screens/average.dart';
import 'package:app/screens/best.dart';
import 'package:app/screens/chart.dart';
import 'package:app/screens/home.dart';
import 'package:app/screens/low.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentindex = 0;

  final List _screens = [
    HomeScreen(),
    Best_screen(),
    Average_screen(),
    Low_screen(),
    Chart_screen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentindex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,

        // unselectedItemColor: Colors.black,
        currentIndex: _currentindex,
        onTap: (index) {
          setState(() {
            _currentindex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.stars, color: Colors.black),
            label: "Best",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.star_half, color: Colors.black),
              label: "Average"),
          BottomNavigationBarItem(
              icon: Icon(Icons.star_outline, color: Colors.black),
              label: "Low"),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_rounded, color: Colors.black),
              label: "Chart"),
        ],
      ),
    );
  }
}
