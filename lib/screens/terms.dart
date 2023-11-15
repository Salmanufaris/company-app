import 'package:flutter/material.dart';

class Terms_Screen extends StatelessWidget {
  final String companyname;
  const Terms_Screen({super.key, required this.companyname});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Terms&Conditions"),
          centerTitle: true,
          backgroundColor: Colors.grey.shade900,
        ),
      ),
    );
  }
}
