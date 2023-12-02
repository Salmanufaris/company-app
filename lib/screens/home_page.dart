import 'dart:io';
import 'package:flutter/material.dart';
import 'package:app/Model/data_model.dart';
import 'package:app/db/functions.dart';
import 'package:app/screens/add_screen.dart';
import 'package:app/screens/detail_page.dart';
import 'package:app/screens/edit_page.dart';

class HomeScreen extends StatefulWidget {
  final EmployeeModel employee;
  final String companyname;

  const HomeScreen(
      {Key? key, required this.employee, required this.companyname})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<EmployeeModel> employeeList = [];

  @override
  void initState() {
    super.initState();
    getAllEmployee();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.cyan[400],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  height: 270,
                  width: 400,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.cyan[800]),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 70,
                      ),
                      Container(
                        height: 50,
                        width: 230,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.lightBlue[200]),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            widget.companyname,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                      Container(
                        height: 30,
                        width: 320,
                        color: Colors.cyan[800],
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => AddScreen(
                                        companyname: widget.companyname),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.lightBlueAccent[100],
                              ),
                              child: const Text(
                                "Add",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 390,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Builder(
                    builder: (context) {
                      return ValueListenableBuilder(
                        valueListenable: employeeListNotifier,
                        builder: (BuildContext ctx,
                            List<EmployeeModel> employeeList, Widget? child) {
                          return Column(
                            children: [
                              for (int index = 0;
                                  index < employeeList.length && index < 4;
                                  index++)
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  color: Colors.lightBlueAccent[100],
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => Detailscreen(
                                            companyname: widget.companyname,
                                            catogery:
                                                employeeList[index].category,
                                            name: employeeList[index].name,
                                            email: employeeList[index].email,
                                            gender: employeeList[index].gender,
                                            image: employeeList[index].image,
                                            number: employeeList[index].number,
                                          ),
                                        ),
                                      );
                                    },
                                    child: ListTile(
                                      title: Text(
                                        employeeList[index].name,
                                        style: const TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                      leading: CircleAvatar(
                                        radius: 30,
                                        backgroundImage: FileImage(
                                            File(employeeList[index].image)),
                                      ),
                                      subtitle: Text(
                                        employeeList[index].category,
                                        style:
                                            const TextStyle(color: Colors.red),
                                      ),
                                      trailing: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            employeeList[index].number,
                                            style: const TextStyle(
                                                color: Colors.purple),
                                          ),
                                          const SizedBox(
                                            width: 6,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              _navigateToEditScreen(
                                                  employeeList[index], index);
                                            },
                                            child: const Icon(
                                              Icons.edit,
                                              color: Colors.black,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 4,
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
                                ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToEditScreen(EmployeeModel data, int index) async {
    final updatedData = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EditScreen(
          companyname: widget.companyname,
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
      setState(() {
        employeeList[index] = updatedData;
      });
    }
  }
}

void _showDeleteDialog(BuildContext context, int index) {
  showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text("Delete Employee"),
      content: const Text("Are you sure you want to delete this employee?"),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("No", style: TextStyle(color: Colors.black)),
        ),
        TextButton(
          onPressed: () {
            deleteemployee(index);
            Navigator.of(context).pop();
          },
          child: const Text(
            "Yes",
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    ),
  );
}
