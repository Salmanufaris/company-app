import 'dart:math';
import 'package:app/db/functions.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class chart extends StatefulWidget {
  const chart({Key? key}) : super(key: key);

  @override
  State<chart> createState() => _chartState();
}

class _chartState extends State<chart> {
  @override
  Widget build(BuildContext context) {
    List skill = employeeListNotifier.value;
    return DefaultTabController(
      initialIndex: 0,
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange[300],
          title: const Text(
            'chart',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true, // Center-align the title text
          elevation: 0,
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(text: ''),
            ],
            labelColor: Colors.white, // Set the selected tab text color
            unselectedLabelColor: Color.fromARGB(
                255, 155, 149, 149), // Set the unselected tab text color
            labelStyle: TextStyle(
              fontSize: 16, // You can adjust the font size if needed
            ),
          ),
        ),
        body: TabBarView(
          children: [chartt(skill: skill)],
        ),
      ),
    );
  }
}

Widget chartt({required skill}) {
  return ValueListenableBuilder(
    valueListenable: employeeListNotifier,
    builder: (context, value, child) {
      return SizedBox(
        height: 500,
        child: PieChart(
          PieChartData(
            sections: List.generate(
              skill.length,
              (index) {
                double cost = double.parse(skill[index].number);
                double totalCost = calculateTotalchart(skill);
                double percentage = (cost / totalCost) * 100;
                final name = skill[index].name;

                return PieChartSectionData(
                  badgePositionPercentageOffset: 1.1,
                  titlePositionPercentageOffset: .4,
                  color: getRandomColor(),
                  value: percentage,
                  title: '''₹ ${cost.toStringAsFixed(2)}
      (${percentage.toStringAsFixed(2)}%)
      $name
      ''',
                  radius: 50,
                  titleStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0)),
                );
              },
            ),
            sectionsSpace: 5,
            centerSpaceRadius: 90,
            startDegreeOffset: 0,
          ),
        ),
      );
    },
  );
}

Color getRandomColor() {
  return Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
}
