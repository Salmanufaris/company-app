import 'package:app/tabs/all.dart';
import 'package:app/tabs/best.dart';
import 'package:app/tabs/avrg.dart';
import 'package:app/tabs/low.dart';
import 'package:flutter/material.dart';

class Employeescreen extends StatelessWidget {
  final String companyname;
  const Employeescreen({super.key, required this.companyname});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: SafeArea(
            child: Scaffold(
          backgroundColor: Colors.teal[100],
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.teal[400],
            bottom: TabBar(
                labelColor: Colors.black,
                indicatorColor: Colors.brown,
                indicatorWeight: 3,
                tabs: [
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
            Allscreen(companyname: companyname),
            Bestscreen(companyname: companyname),
            Averagescreen(companyname: companyname),
            Lowscreen(companyname: companyname),
          ]),
        )));
  }
}
