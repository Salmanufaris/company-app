import 'dart:io';
import 'package:flutter/material.dart';
import 'package:app/Model/data_model.dart';
import 'package:app/db/functions.dart';
import 'package:app/screens/add.dart';
import 'package:app/screens/detail.dart';
import 'package:app/screens/edit.dart';

class HomeScreen extends StatefulWidget {
  final EmployeeModel employee;
  final String companyname;

  HomeScreen({Key? key, required this.employee, required this.companyname})
      : super(key: key);

  @override
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
          backgroundColor: Colors.teal[300], // Updated app bar color
          leading: Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.tealAccent, // Updated background color
        body: Center(
          child: Column(
            children: [
              Container(
                height: 270,
                width: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.teal, // Updated container color
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 70,
                    ),
                    Container(
                      height: 50,
                      width: 230,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          widget.companyname,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.teal[600], // Updated container color
                      ),
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    Container(
                      height: 30,
                      width: 320,
                      color: Colors.teal, // Updated container color
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
                              primary: Colors.white, // Updated button color
                            ),
                            child: Text(
                              "Add",
                              style: TextStyle(
                                color: Colors.indigo,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white, // Updated button color
                            ),
                            child: Text(
                              "Months",
                              style: TextStyle(
                                color: Colors.indigo,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  height: 400,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.teal[900], // Updated container color
                  ),
                  child: Builder(
                    builder: (context) {
                      return ValueListenableBuilder(
                        valueListenable: employeeListNotifier,
                        builder: (BuildContext ctx,
                            List<EmployeeModel> employeeList, Widget? child) {
                          return ListView.builder(
                            itemBuilder: (ctx, index) {
                              final data = employeeList[index];
                              return Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                color: Colors.deepPurpleAccent[
                                    800], // Updated card color
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => Detailscreen(
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
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    leading: CircleAvatar(
                                      radius: 30,
                                      backgroundImage:
                                          FileImage(File(data.image)),
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
                                            _navigateToEditScreen(data, index);
                                          },
                                          child: Icon(
                                            Icons.edit,
                                            color: Colors.black,
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            deleteemployee(index);
                                          },
                                          child: Icon(
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
                            itemCount: employeeList.length,
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
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
