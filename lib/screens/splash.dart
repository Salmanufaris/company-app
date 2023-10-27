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
      backgroundColor: Colors.blue,
      body: Center(
        child: Text(
          " YOUR WELCOME",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Future<void> gotoLoginpage() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }
}
