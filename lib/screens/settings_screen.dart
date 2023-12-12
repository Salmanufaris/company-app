import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:app/screens/about_page.dart';
import 'package:app/screens/logout_screen.dart';
import 'package:app/screens/reset_screen.dart';
import 'package:app/screens/terms_page.dart';

class SettingsScreen extends StatelessWidget {
  final String companyname;

  const SettingsScreen({super.key, required this.companyname});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.cyan[400],
          title: const Text(
            "Settings",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            // Lottie animation

            // List items
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AboutScreen(
                          companyname: "",
                        )));
              },
              child: const ListTile(
                title: Text("About"),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const TermsScreen(
                          companyname: "",
                        )));
              },
              child: const ListTile(
                title: Text("Terms&Conditions"),
              ),
            ),
            InkWell(
              onTap: () {
                resetAndClearData(context);
              },
              child: const ListTile(
                title: Text("Reset"),
              ),
            ),
            InkWell(
              onTap: () {
                logoutAndClearData(context);
              },
              child: const ListTile(
                title: Text("Logout"),
              ),
            ),
            Lottie.asset(
              'assets/images/Animation - 1700826901733.json', // Replace with the actual path to your Lottie file
              height: 400, // Adjust the height as needed
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}