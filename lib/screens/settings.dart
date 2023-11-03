import 'package:app/screens/about.dart';
import 'package:app/screens/login.dart';
import 'package:app/screens/terms.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade900,
          title: Text("Settings"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            InkWell(
              splashColor: Colors.amber,
              hoverColor: Colors.grey,
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AboutScreen()));
              },
              child: ListTile(
                title: Text("About"),
              ),
            ),
            InkWell(
              hoverColor: Colors.grey,
              splashColor: Colors.amber,
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Terms_Screen()));
              },
              child: ListTile(
                title: Text("Terms&Conditions"),
              ),
            ),
            InkWell(
              onTap: () {},
              hoverColor: Colors.grey,
              splashColor: Colors.amber,
              child: ListTile(
                title: Text("Reset"),
              ),
            ),
            InkWell(
              hoverColor: Colors.grey,
              splashColor: Colors.amber,
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: ListTile(
                title: Text("Logout"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
