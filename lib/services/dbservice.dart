import 'package:app/Model/data_model.dart';
import 'package:hive/hive.dart';

class DbService {
  Future<List<EmployeeModel>> getAllEmployee() async {
    final employeeDB = await Hive.openBox<EmployeeModel>('employee_db');
    return employeeDB.values.toList();
  }

  Future<void> adddata(EmployeeModel value) async {
    final employeeDB = await Hive.openBox<EmployeeModel>('employee_db');
    await employeeDB.add(value);
  }

  Future<void> deleteemployee(int index) async {
    final employeeDB = await Hive.openBox<EmployeeModel>('employee_db');
    await employeeDB.deleteAt(index);
  }

  Future<void> editemployee(index, EmployeeModel value) async {
    final employeeDB = await Hive.openBox<EmployeeModel>('employee_db');
    await employeeDB.putAt(index, value);
  }
}
