import 'package:app/screens/about.dart';
import 'package:app/screens/login.dart';
import 'package:app/screens/terms.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  final String companyname;
  const SettingsScreen({super.key, required this.companyname});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.teal[100],
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.teal[300], // Updated app bar color
          title: Text("Settings"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AboutScreen(
                          companyname: "",
                        )));
              },
              child: ListTile(
                title: Text("About"),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Terms_Screen(
                          companyname: "",
                        )));
              },
              child: ListTile(
                title: Text("Terms&Conditions"),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Reset"),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Loginscreen()));
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
