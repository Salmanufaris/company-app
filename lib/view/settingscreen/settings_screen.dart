import 'package:app/helpers/colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:app/view/aboutscreen/about.dart';
import 'package:app/view/logoutscreen/logout_screen.dart';
import 'package:app/view/resetscreen/reset_screen.dart';
import 'package:app/view/termsscreen/terms_page.dart';

class SettingsScreen extends StatelessWidget {
  final String companyname;

  const SettingsScreen({super.key, required this.companyname});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MainColours.bgwhite,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: MainColours.homebgColor[400],
          title: const Text(
            "Settings",
            style: TextStyle(color: MainColours.bgblack),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
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
                'assets/images/Animation - 1700826901733.json',
                height: 400,
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
