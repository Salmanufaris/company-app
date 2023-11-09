import 'package:flutter/material.dart';

class Terms_Screen extends StatelessWidget {
  const Terms_Screen({super.key});
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
