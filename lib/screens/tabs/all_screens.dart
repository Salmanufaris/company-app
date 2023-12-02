import 'dart:io';
import 'package:app/Model/data_model.dart';
import 'package:app/db/functions.dart';
import 'package:app/screens/detail_page.dart';
import 'package:app/screens/edit_page.dart';
import 'package:app/screens/tabs/allscreen_filter.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Allscreen extends StatefulWidget {
  final String companyname;

  const Allscreen({Key? key, required this.companyname}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AllscreenState createState() => _AllscreenState();
}

class _AllscreenState extends State<Allscreen> {
  List<EmployeeModel> filteredEmployeeList = [];
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.only(right: 200),
            child: TextButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: EmployeeSearch(
                    filteredEmployeeList,
                  ),
                );
              },
              child: const Text(
                "search.......",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: EmployeeSearch(
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
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset(
                              'assets/images/listempty.json',
                              height: 200,
                              width: 200,
                            ),
                          ],
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
                              color: Colors.lightBlueAccent[100],
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
                                      style:
                                          const TextStyle(color: Colors.purple),
                                    ),
                                    const SizedBox(
                                      width: 6,
                                    ),
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
            child: const Text("Yes", style: TextStyle(color: Colors.red)),
          ),
        ],
      );
    },
  );
}
