import 'dart:io';
import 'package:app/controller/dbprovider.dart';
import 'package:app/view/addscreen/add_screen.dart';
import 'package:app/view/detailscreen/detail_page.dart';
import 'package:app/helpers/colors.dart';
import 'package:app/view/editscreen/edit_page.dart';
import 'package:flutter/material.dart';
import 'package:app/Model/data_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  final EmployeeModel employee;
  final String companyname;

  const HomeScreen({
    super.key,
    required this.employee,
    required this.companyname,
  });

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<EmployeeModel> employeeList = [];

  @override
  void initState() {
    super.initState();
    Provider.of<DbProvider>(context, listen: false).getalldata();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: MainColours.homebgColor[400],
        ),
        backgroundColor: MainColours.bgwhite,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 5,
                ),
                Container(
                  height: 270,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.cyan[800],
                  ),
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
                          color: Colors.lightBlue[200],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            widget.companyname,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
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
                                      companyname: widget.companyname,
                                    ),
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
                    color: MainColours.bgwhite,
                  ),
                  child: Builder(
                    builder: (context) {
                      return Consumer<DbProvider>(
                        builder: (context, value, child) {
                          return Column(
                            children: [
                              Expanded(
                                child: ListView.builder(
                                  itemCount: value.emploList.length > 4
                                      ? 4
                                      : value.emploList.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final data = value.emploList[index];
                                    return Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      color: Colors.lightBlueAccent[100],
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  Detailscreen(
                                                categery: "",
                                                companyname: widget.companyname,
                                                catogery: data.category,
                                                name: data.name,
                                                email: data.email,
                                                gender: data.gender,
                                                image: data.image,
                                                number: data.number,
                                              ),
                                            ),
                                          );
                                        },
                                        child: ListTile(
                                          title: Text(
                                            data.name,
                                            style: const TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                          leading: CircleAvatar(
                                            radius: 30,
                                            backgroundImage: FileImage(
                                              File(data.image),
                                            ),
                                          ),
                                          subtitle: Text(
                                            data.category,
                                            style: const TextStyle(
                                              color: Colors.red,
                                            ),
                                          ),
                                          trailing: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                data.number,
                                                style: const TextStyle(
                                                  color: Colors.purple,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 6,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              EditScreen(
                                                                index: index,
                                                                name: data.name,
                                                                email:
                                                                    data.email,
                                                                category: data
                                                                    .category,
                                                                companyname: widget
                                                                    .companyname,
                                                                gender:
                                                                    data.gender,
                                                                image: "",
                                                                number:
                                                                    data.number,
                                                              )));
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
                                                  showDeleteDialog(
                                                      context, index);
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

  void showDeleteDialog(BuildContext context, int index) {
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
                style: TextStyle(color: MainColours.bgblack),
              ),
            ),
            TextButton(
              onPressed: () {
                Provider.of<DbProvider>(context, listen: false)
                    .deleteemployee(index);
                Navigator.of(context).pop();
              },
              child: const Text(
                "Yes",
                style: TextStyle(color: MainColours.bgred),
              ),
            ),
          ],
        );
      },
    );
  }
}
