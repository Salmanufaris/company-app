import 'package:app/Model/data_model.dart';
import 'package:app/screens/average.dart';
import 'package:app/screens/best.dart';
import 'package:app/screens/chart.dart';
import 'package:app/screens/home.dart';
import 'package:app/screens/low.dart';
import 'package:flutter/material.dart';

class BottomBar1 extends StatefulWidget {
  BottomBar1({
    super.key,
    // required EmployeeModel employee,
  });

  @override
  State<BottomBar1> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar1> {
  int _currentindex = 0;

  final screens = [
    HomeScreen(
        employee: EmployeeModel(
            id: '', name: '', adress: '', gender: '', email: '', phone: '')),
    Bestscreen(),
    Averagescreen(),
    Lowscreen(),
    Chartscreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentindex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.teal[300],

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
