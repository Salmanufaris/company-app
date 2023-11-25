import 'dart:io';
import 'package:app/Model/data_model.dart';
import 'package:app/db/functions.dart';
import 'package:app/screens/detail.dart';
import 'package:app/screens/edit.dart';
import 'package:app/screens/sub/filter.dart';
import 'package:flutter/material.dart';

class Allscreen extends StatefulWidget {
  final String companyname;

  const Allscreen({Key? key, required this.companyname}) : super(key: key);

  @override
  _AllscreenState createState() => _AllscreenState();
}

class _AllscreenState extends State<Allscreen> {
  List<EmployeeModel> filteredEmployeeList = [];
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.orange[400],
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.amber[600],
          leading: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: EmployeeSearchDelegate(
                  filteredEmployeeList,
                ),
              );
            },
          ),
        ),
        body: Builder(
          builder: (context) {
            return ValueListenableBuilder(
              valueListenable: employeeListNotifier,
              builder: (BuildContext ctx, List<EmployeeModel> employeeList,
                  Widget? child) {
                filteredEmployeeList = List.from(employeeList);

                return filteredEmployeeList.isEmpty
                    ? const Center(
                        child: Text(
                          "list is empty",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemBuilder: (ctx, index) {
                          final data = filteredEmployeeList[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Detailscreen(
                                    companyname: widget.companyname,
                                    name: data.name,
                                    gender: data.gender,
                                    catogery: data.category,
                                    email: data.email,
                                    number: data.number,
                                    image: data.image,
                                  ),
                                ),
                              );
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
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
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => EditScreen(
                                              companyname: "",
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
                                      },
                                      child: const Icon(
                                        Icons.edit,
                                        color: Colors.black,
                                      ),
                                    ),
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
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: filteredEmployeeList.length,
                      );
              },
            );
          },
        ),
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
