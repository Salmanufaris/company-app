import 'package:app/Model/data_model.dart';
import 'package:flutter/material.dart';

class Bestscreen extends StatelessWidget {
  const Bestscreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.teal[500],
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.teal[300],
          title: Text(
            "Best Employees",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
       import 'package:flutter/material.dart';
import 'package:app/Model/data_model.dart';

class BestScreen extends StatelessWidget {
  final List<EmployeeModel> employeeList;

  BestScreen({required this.employeeList});

  @override
  Widget build(BuildContext context) {
    // Implement UI for displaying employees with "Best" rating
    // For example:
    return Scaffold(
      appBar: AppBar(title: Text("Best Employees")),
      body: ListView.builder(
        itemCount: employeeList.length,
        itemBuilder: (context, index) {
          // Build UI for each employee in the list
          return ListTile(
            title: Text(employeeList[index].name),
            // ... (Other employee details go here)
          );
        },
      ),
    );
  }
}

// Similar implementation for AverageScreen and LowScreen

      ),
    );
  }

  // Container list({required String id}) {
  //   return Container(
  //     alignment: Alignment.centerLeft,
  //     padding: EdgeInsets.all(5),
  //     height: 60,
  //     width: 350,
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(7),
  //       color: Colors.teal[100],
  //     ),
  //     child: Text(
  //       id,
  //     ),
  //   );
}
