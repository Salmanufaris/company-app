import 'package:flutter/material.dart';

class IntroScree1 extends StatelessWidget {
  const IntroScree1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Container(
          alignment: Alignment.bottomCenter,
          height: 100,
          width: 360,
          color: Colors.green,
          child: Text(
            "Start your journey",
            style: TextStyle(fontSize: 25),
          ),
        ),
      ),
    );
  }
}
