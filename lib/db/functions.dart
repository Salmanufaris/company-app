import 'package:app/Model/model.dart';
import 'package:flutter/material.dart';

ValueNotifier<List<EmployeeList>> employeeListNotifier = ValueNotifier([]);

void addEmployee(EmployeeList value) {
  employeeListNotifier.value.add(value);
  employeeListNotifier.notifyListeners();
}
