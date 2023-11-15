import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chartscreen extends StatefulWidget {
  final String companyname;
  const Chartscreen({super.key, required this.companyname});
  @override
  State<Chartscreen> createState() => _Chart_screenState();
}

class _Chart_screenState extends State<Chartscreen> {
  late List<GDPData> _Chartdata;

  @override
  void initState() {
    _Chartdata = getChartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.teal[100],
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.teal[300], // Updated app bar color
          title: Text("Chart"),
          centerTitle: true,
        ),
        body: SfCircularChart(
          legend: Legend(
              isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
          series: <CircularSeries>[
            DoughnutSeries<GDPData, String>(
                dataSource: _Chartdata,
                xValueMapper: (GDPData data, _) => data.continent,
                yValueMapper: (GDPData data, _) => data.gdp,
                dataLabelSettings: DataLabelSettings(
                  isVisible: true,
                ))
          ],
        ),
      ),
    );
  }

  List<GDPData> getChartData() {
    final List<GDPData> ChartData = [
      GDPData("Best", 50),
      GDPData("Average", 25),
      GDPData("Low", 25),
    ];
    return ChartData;
  }
}

class GDPData {
  GDPData(this.continent, this.gdp);
  final String continent;
  final int gdp;
}
