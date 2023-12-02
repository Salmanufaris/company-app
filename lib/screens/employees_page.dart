import 'package:app/screens/tabs/all_screens.dart';
import 'package:app/screens/tabs/best_screens.dart';
import 'package:app/screens/tabs/average_screens.dart';
import 'package:app/screens/tabs/low_screens.dart';
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
          backgroundColor: Colors.orange[100],
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.cyan[400],
            bottom: const TabBar(
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
