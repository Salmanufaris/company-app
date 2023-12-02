import 'package:app/db/functions.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Chart extends StatefulWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    List skill = employeeListNotifier.value;
    return DefaultTabController(
      initialIndex: 0,
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan[400],
          title: const Text(
            'chart',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          elevation: 0,
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(text: ''),
            ],
            labelColor: Colors.white,
            unselectedLabelColor: Color.fromARGB(255, 155, 149, 149),
            labelStyle: TextStyle(
              fontSize: 16,
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
  if (skill.isEmpty) {
    return EmptyChart(); // Show Lottie animation if skill list is empty
  }

  Map<String, Color> categoryColors = {
    'Best': Colors.red,
    'Average': Colors.black,
    'Low': Colors.green,
  };

  int bestCount = skill.where((item) => item.category == 'Best').length;

  Map<String, double> categoryValues = {};

  for (int index = 0; index < skill.length; index++) {
    double per = double.parse(skill[index].number);
    double percentage = (per / calculateTotalchart(skill)) * 100;
    String category = skill[index].category;

    if (categoryValues.containsKey(category)) {
      categoryValues[category] = categoryValues[category]! + percentage;
    } else {
      categoryValues[category] = percentage;
    }
  }

  return Column(
    children: [
      SizedBox(
        height: 500,
        child: Stack(
          alignment: Alignment.center,
          children: [
            PieChart(
              PieChartData(
                sections: categoryValues.entries.map((entry) {
                  String category = entry.key;
                  double percentage = entry.value;

                  Color sectionColor = categoryColors[category] ?? Colors.grey;

                  // Dynamically adjust the size of 'Best' section
                  if (category == 'Best') {
                    return PieChartSectionData(
                      color: sectionColor,
                      value:
                          percentage * (1 + 0.2 * bestCount), // Increase size
                      title: '',
                      radius: 50,
                    );
                  }

                  return PieChartSectionData(
                    color: sectionColor,
                    value: percentage,
                    title: '',
                    radius: 50,
                  );
                }).toList(),
                centerSpaceRadius: 90,
                startDegreeOffset: 0,
              ),
            ),
            const Positioned(
              top: 20, // Adjust the position as needed
              child: Text(
                'Per',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        height: 100,
        width: 300,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: categoryColors.entries.map((entry) {
            String category = entry.key;
            Color color = entry.value;
            double percentage = categoryValues[category] ?? 0.0;

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    color: color,
                  ),
                  const SizedBox(width: 10), // Adjust the spacing here
                  Text(
                    '$category                                per ${percentage.toStringAsFixed(2)}%',
                    style: const TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    ],
  );
}

// ignore: use_key_in_widget_constructors
class EmptyChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        'assets/images/chart.json', // Replace with the path to your Lottie animation
        height: 200,
        width: 200,
      ),
    );
  }
}
