import 'package:app/tabs/all.dart';
import 'package:app/tabs/tab1.dart';
import 'package:app/tabs/tab2.dart';
import 'package:app/tabs/tab3.dart';
import 'package:flutter/material.dart';

class Employeescreen extends StatelessWidget {
  const Employeescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: SafeArea(
            child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal[400],
            bottom: TabBar(tabs: [
              Tab(
                text: "All",
              ),
              Tab(
                text: "Best",
              ),
              Tab(
                text: "Average",
              ),
              Tab(
                text: "Low",
              ),
            ]),
          ),
          body: TabBarView(children: [
            Allscreen(),
            Tabscreen1(),
            Tabscreen2(),
            Tabscreen3(),
          ]),
        )));
  }
}
