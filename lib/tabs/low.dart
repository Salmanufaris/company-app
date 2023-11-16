import 'dart:io';

import 'package:app/Model/data_model.dart';
import 'package:app/db/functions.dart';
import 'package:app/screens/detail.dart';
import 'package:app/screens/edit.dart';
import 'package:flutter/material.dart';

class Lowscreen extends StatefulWidget {
  final String companyname;
  const Lowscreen({super.key, required this.companyname});

  @override
  State<Lowscreen> createState() => _LowscreenState();
}

class _LowscreenState extends State<Lowscreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.orange[400],
        body: Builder(builder: (context) {
          return ValueListenableBuilder(
            valueListenable: employeeListNotifier,
            builder: (BuildContext ctx, List<EmployeeModel> employeeList,
                Widget? child) {
              final filteredEmployeList = employeeList
                  .where((Employe) => Employe.category?.contains('Low') == true)
                  .toList();
              return ListView.builder(
                itemBuilder: (ctx, index) {
                  final data = filteredEmployeList[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Detailscreen(
                              companyname: "",
                              name: data.name,
                              gender: data.gender,
                              catogery: data.category,
                              email: data.email,
                              number: data.number,
                              image: data.image)));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: Colors.orange[100],
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
                                            companyname: "",
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
                            SizedBox(
                              width: 10,
                            ),
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
