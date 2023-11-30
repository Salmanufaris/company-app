import 'package:app/Model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

ValueNotifier<List<EmployeeModel>> employeeListNotifier = ValueNotifier([]);
Future<void> addEmployee(EmployeeModel value) async {
  final employeeDB = await Hive.openBox<EmployeeModel>('employee_db');
  await employeeDB.add(value);
  employeeListNotifier.value.add(value);
  employeeListNotifier.notifyListeners();
  getAllEmployee();
}

Future<void> getAllEmployee() async {
  final employeeDB = await Hive.openBox<EmployeeModel>('employee_db');
  employeeListNotifier.value.clear();
  employeeListNotifier.value.addAll(employeeDB.values);
  employeeListNotifier.notifyListeners();
}

Future<void> editemployee(index, EmployeeModel value) async {
  final employeeDB = await Hive.openBox<EmployeeModel>('employee_db');
  employeeListNotifier.value.clear();
  employeeListNotifier.value.addAll(employeeDB.values);
  employeeListNotifier.notifyListeners();
  employeeDB.putAt(index, value);
  getAllEmployee();
}

Future<void> deleteemployee(int index) async {
  final employeeDB = await Hive.openBox<EmployeeModel>('employee_db');
  employeeDB.deleteAt(index);
  getAllEmployee();
}

//chart calcultion

double calculateTotalchart(List<EmployeeModel> perfomance) {
  double totalCost = 0;
  for (var per in perfomance) {
    totalCost += double.parse(per.number);
  }
  return totalCost;
}
