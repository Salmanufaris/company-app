import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("About"),
          centerTitle: true,
          backgroundColor: Colors.grey.shade900,
        ),
      ),
    );
  }
}
