import 'package:app/Model/data_model.dart';
import 'package:app/screens/employees_page.dart';
import 'package:app/screens/chart_page.dart';
import 'package:app/screens/home_page.dart';
import 'package:app/screens/settings_screen.dart';
import 'package:flutter/material.dart';

class BottomBar1 extends StatefulWidget {
  final String companyname;
  const BottomBar1({
    super.key,
    required this.companyname,
    required String updatedImage,
  });

  @override
  State<BottomBar1> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar1> {
  int currentindex = 0;
  List<Widget> screens = [];
  late Widget currentScreen;
  @override
  void initState() {
    super.initState();
    screens = [
      HomeScreen(
        companyname: widget.companyname,
        employee: EmployeeModel(
          name: '',
          gender: '',
          email: '',
          number: '',
          category: "",
          image: "",
        ),
      ),
      Employeescreen(companyname: widget.companyname),
      const Chart(),
      SettingsScreen(companyname: widget.companyname),
    ];
    currentScreen = screens[currentindex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentindex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.cyan[400],
        currentIndex: currentindex,
        onTap: (index) {
          setState(() {
            currentindex = index;
          });
        },
        items: const [
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
              icon: Icon(Icons.bar_chart, color: Colors.black), label: "Chart"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings, color: Colors.black),
              label: "Settings"),
        ],
      ),
    );
  }
}
