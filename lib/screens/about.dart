import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  final String companyname;

  const AboutScreen({super.key, required this.companyname});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
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
