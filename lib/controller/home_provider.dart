import 'package:app/Model/data_model.dart';
import 'package:app/view/editscreen/edit_page.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  List<EmployeeModel> employeeList = [];

  void navigateToEditScreen(
      EmployeeModel data, String companyname, int index, context) async {
    final updatedData = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EditScreen(
          companyname: companyname,
          category: data.category,
          email: data.email,
          gender: data.gender,
          image: data.image,
          index: index,
          name: data.name,
          number: data.number,
        ),
      ),
    );

    if (updatedData != null) {
      employeeList[index] = updatedData;
    }
    notifyListeners();
  }
}
