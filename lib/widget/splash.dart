import 'package:app/main.dart';
import 'package:app/screens/login.dart';
import 'package:app/widget/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget {
  Splashscreen({super.key});

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
    return Scaffold(
      backgroundColor: Colors.black,
    );
  }

  Future<void> gotoLoginpage() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => Loginscreen()),
    );
  }

  Future<void> CheckUserLoggedIn() async {
    final _sharedprefs = await SharedPreferences.getInstance();
    final _userLoggedIn = _sharedprefs.getBool(SAVE_KEY_NAME);
    if (_userLoggedIn == null || _userLoggedIn == false) {
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
