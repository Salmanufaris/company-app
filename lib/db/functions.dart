import 'package:app/Model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

ValueNotifier<List<EmployeeModel>> employeeListNotifier = ValueNotifier([]);
Future<void> addEmployee(EmployeeModel value) async {
  final employeedb = await Hive.openBox<EmployeeModel>('employeedb');
  await employeedb.add(value);
  getAllEmployee();
}

Future<void> getAllEmployee() async {
  final employeedb = await Hive.openBox<EmployeeModel>('employeedb');
  employeeListNotifier.value.clear();

  employeeListNotifier.value.addAll(employeedb.values);
  employeeListNotifier.notifyListeners();
}

Future<void> editEmployee(index, EmployeeModel value) async {
  final employeedb = await Hive.openBox<EmployeeModel>('employeedb');
  employeeListNotifier.value.clear();
  employeeListNotifier.value.addAll(employeedb.values);
  employeeListNotifier.notifyListeners();
  employeedb.putAt(index, value);
  getAllEmployee();
}

Future<void> deleteEmployee(int index) async {
  final employeedb = await Hive.openBox<EmployeeModel>('employeedb');
  employeedb.deleteAt(index);
  getAllEmployee();
}
