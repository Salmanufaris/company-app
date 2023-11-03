import 'package:flutter/material.dart';

class IntroScree1 extends StatelessWidget {
  const IntroScree1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      body: Center(
        child: Container(
          alignment: Alignment.bottomCenter,
          height: 100,
          width: 360,
          color: Colors.indigo[900],
          child: Text(
            "START YOUR JOURNEY",
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
