import 'dart:io';

import 'package:app/Model/data_model.dart';
import 'package:app/db/functions.dart';
import 'package:app/screens/edit.dart';
import 'package:flutter/material.dart';

class Averagescreen extends StatefulWidget {
  const Averagescreen({super.key});

  @override
  State<Averagescreen> createState() => _AveragescreenState();
}

class _AveragescreenState extends State<Averagescreen> {
  List<EmployeeModel> filteredEmployeList = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Builder(builder: (context) {
          return ValueListenableBuilder(
            valueListenable: employeeListNotifier,
            builder: (BuildContext ctx, List<EmployeeModel> employeeList,
                Widget? child) {
              final filteredEmployeList = employeeList
                  .where((Employe) =>
                      Employe.category?.contains('Average') == true)
                  .toList();
              return ListView.builder(
                itemBuilder: (ctx, index) {
                  final data = filteredEmployeList[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Colors.teal[200],
                    child: ListTile(
                      title: Text(
                        data.name,
                        style: TextStyle(color: Colors.black),
                      ),
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: FileImage(File(data.image)),
                      ),
                      subtitle: Text(
                        data.category,
                        style: TextStyle(color: Colors.red),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => EditScreen(
                                          category: data.category,
                                          email: data.email,
                                          gender: data.gender,
                                          image: data.image,
                                          index: index,
                                          name: data.name,
                                          number: data.number,
                                        )));
                              },
                              child: Icon(
                                Icons.edit,
                                color: Colors.black,
                              )),
                          GestureDetector(
                              onTap: () {
                                deleteemployee(index);
                              },
                              child: Icon(
                                Icons.delete,
                                color: Colors.red,
                              )),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: filteredEmployeList.length,
              );
            },
          );
        }),
      ),
    );
  }
}
