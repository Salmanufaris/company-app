import 'package:app/screens/login.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SplashScreen> {
  @override
  void initState() {
    gotoLoginpage();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(),
    );
  }

  Future<void> gotoLoginpage() async {
    await Future.delayed(Duration(seconds: 1));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }
}
