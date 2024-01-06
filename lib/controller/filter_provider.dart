import 'package:flutter/material.dart';

import 'package:app/Model/data_model.dart';

class Filterprovider extends ChangeNotifier {
  List<EmployeeModel> filteredEmployeeList = [];
  TextEditingController searchController = TextEditingController();

  late List<String> filterThings = [];
  List<String> things = ["Best", "Low", "Average"];

  void filterEmployees(List<EmployeeModel> employees, String query) {
    filteredEmployeeList = employees
        .where(
          (employee) =>
              employee.category.toLowerCase().contains(query.toLowerCase()) &&
              filterThings.contains(employee.category),
        )
        .toList();

    notifyListeners();
  }
}
