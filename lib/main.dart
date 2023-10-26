import 'package:app/screens/bottombar.dart';
import 'package:app/screens/login.dart';
import 'package:app/screens/splash.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: SplashScreen(),
    );
  }
}
