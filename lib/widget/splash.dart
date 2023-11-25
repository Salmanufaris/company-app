// ignore_for_file: use_build_context_synchronously, non_constant_identifier_names

import 'package:app/main.dart';
import 'package:app/screens/login.dart';
import 'package:app/widget/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Splashscreen> {
  @override
  void initState() {
    CheckUserLoggedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          "Company App",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Future<void> gotoLoginpage() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const Loginscreen()),
    );
  }

  Future<void> CheckUserLoggedIn() async {
    final sharedprefs = await SharedPreferences.getInstance();
    final userLoggedIn = sharedprefs.getBool(SAVE_KEY_NAME);
    if (userLoggedIn == null || userLoggedIn == false) {
      gotoLoginpage();
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (ctx1) => BottomBar1(
                updatedImage: "",
                companyname: "welcome back ",
              )));
    }
  }
}
