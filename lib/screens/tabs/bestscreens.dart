import 'dart:io';

import 'package:app/Model/data_model.dart';
import 'package:app/db/functions.dart';
import 'package:app/screens/detailpage.dart';
import 'package:app/screens/editpage.dart';
import 'package:flutter/material.dart';

class Bestscreen extends StatefulWidget {
  final String companyname;
  const Bestscreen({super.key, required this.companyname});

  @override
  State<Bestscreen> createState() => _BestscreenState();
}

class _BestscreenState extends State<Bestscreen> {
  List<EmployeeModel> filteredEmployeList = [];
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
                  .where(
                      (Employe) => Employe.category?.contains('Best') == true)
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
                          style: const TextStyle(color: Colors.black),
                        ),
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: FileImage(File(data.image)),
                        ),
                        subtitle: Text(
                          data.category,
                          style: const TextStyle(color: Colors.red),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              employeeList[index].number,
                              style: const TextStyle(color: Colors.purple),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
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
                                child: const Icon(
                                  Icons.edit,
                                  color: Colors.black,
                                )),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                                onTap: () {
                                  _showDeleteDialog(context, index);
                                },
                                child: const Icon(
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

void _showDeleteDialog(BuildContext context, int index) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Delete Employee"),
        content: const Text("Are you sure you want to delete this employee?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              "No",
              style: TextStyle(color: Colors.black),
            ),
          ),
          TextButton(
            onPressed: () {
              deleteemployee(index);
              Navigator.of(context).pop();
            },
            child: const Text("Yes"),
          ),
        ],
      );
    },
  );
}
