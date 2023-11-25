import 'package:app/screens/tabs/allscreens.dart';
import 'package:app/screens/tabs/bestscreens.dart';
import 'package:app/screens/tabs/averagescreens.dart';
import 'package:app/screens/tabs/lowscreens.dart';
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
            backgroundColor: Colors.orange[200],
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
