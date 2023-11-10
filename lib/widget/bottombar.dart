import 'package:app/Model/data_model.dart';

import 'package:app/screens/employees.dart';
import 'package:app/screens/chart.dart';
import 'package:app/screens/home.dart';

import 'package:app/screens/settings.dart';
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
            name: '',
            gender: '',
            email: '',
            number: '',
            category: "",
            image: "")),
    Employeescreen(),
    Chartscreen(),
    SettingsScreen(),
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
            icon: Icon(Icons.person, color: Colors.black),
            label: "Employees",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_rounded, color: Colors.black),
              label: "Chart"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings, color: Colors.black),
              label: "Settings"),
        ],
      ),
    );
  }
}
