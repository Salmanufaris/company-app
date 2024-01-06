import 'package:app/Model/data_model.dart';
import 'package:app/services/dbservice.dart';
import 'package:flutter/material.dart';

class DbProvider extends ChangeNotifier {
  List<EmployeeModel> emploList = [];
  List<EmployeeModel> charTliST = [];
  DbService dbservices = DbService();

  Future<void> getalldata() async {
    emploList = await dbservices.getAllEmployee();
    notifyListeners();
  }

  Future<void> addEmployee(EmployeeModel value) async {
    await dbservices.adddata(value);
    await getalldata();
  }

  Future<void> deleteemployee(int index) async {
    await dbservices.deleteemployee(index);
    await getalldata();
  }

  Future<void> editemployee(index, EmployeeModel value) async {
    await dbservices.editemployee(index, value);
    notifyListeners();
    await getalldata();
  }

  double calculateTotalchart(List<EmployeeModel> perfomance) {
    double totalCost = 0;
    for (var per in perfomance) {
      totalCost += double.parse(per.number);
    }
    return totalCost;
  }
}
