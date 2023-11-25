import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chartscreen extends StatefulWidget {
  final String companyname;

  const Chartscreen({Key? key, required this.companyname}) : super(key: key);

  @override
  State<Chartscreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<Chartscreen> {
  late List<GDPData> _chartData;
  late String _selectedRange;

  @override
  void initState() {
    super.initState();
    _selectedRange = "Day";
    _updateChartData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.orange[400],
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.orange[200],
          title: const Text("Chart"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            _buildFilterDropdown(),
            Expanded(
              child: SfCircularChart(
                legend: const Legend(
                  isVisible: true,
                  overflowMode: LegendItemOverflowMode.wrap,
                ),
                series: <CircularSeries>[
                  DoughnutSeries<GDPData, String>(
                    dataSource: _chartData,
                    xValueMapper: (GDPData data, _) => data.continent,
                    yValueMapper: (GDPData data, _) => data.gdp,
                    dataLabelSettings: const DataLabelSettings(
                      isVisible: true,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterDropdown() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          const Text("Filter: "),
          DropdownButton<String>(
            value: _selectedRange,
            items: ["Day", "Week"].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? value) {
              if (value != null) {
                setState(() {
                  _selectedRange = value;
                  _updateChartData();
                });
              }
            },
          ),
        ],
      ),
    );
  }

  void _updateChartData() {
    if (_selectedRange == "Day") {
      _chartData = [
        GDPData("Best", 50),
        GDPData("Average", 25),
        GDPData("Low", 25),
      ];
    } else if (_selectedRange == "Week") {
      _chartData = [
        GDPData("Best", 40),
        GDPData("Average", 30),
        GDPData("Low", 30),
      ];
    } else {
      _chartData = [];
    }
  }
}

class GDPData {
  GDPData(this.continent, this.gdp);
  final String continent;
  final int gdp;
}
