import 'dart:io';

import 'package:app/Model/data_model.dart';
import 'package:app/db/functions.dart';
import 'package:app/screens/add.dart';
import 'package:app/screens/edit.dart';
import 'package:app/screens/settings.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  EmployeeModel employee;

  HomeScreen({Key? key, required this.employee}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List employeeList = [];

  String dropdownvalue = "Best";

  var items = [
    "Best",
    "Average",
    "Low",
  ];

  @override
  Widget build(BuildContext context) {
    getAllEmployee();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.teal[300],
          leading: Icon(
            Icons.search,
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SettingsScreen()));
                },
                child: Text(
                  "Settings",
                  style: TextStyle(color: Colors.black),
                ))
          ],
        ),
        backgroundColor: Colors.teal[500],
        body: Center(
          child: Column(
            children: [
              Container(
                height: 270,
                width: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.teal[400],
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 2,
                    ),
                    CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.teal[100],
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      "Company name",
                      style: TextStyle(color: Colors.black),
                    ),
                    Container(
                      height: 30,
                      width: 320,
                      color: Colors.teal[400],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => AddScreen()));
                              },
                              child: Text(
                                "Add",
                                style: TextStyle(color: Colors.black),
                              )),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "Months",
                                style: TextStyle(color: Colors.black),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Expanded(
                child: Container(
                  height: 400,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.teal[700],
                  ),
                  child: Builder(builder: (context) {
                    return ValueListenableBuilder(
                      valueListenable: employeeListNotifier,
                      builder: (BuildContext ctx,
                          List<EmployeeModel> employeeList, Widget? child) {
                        return ListView.builder(
                          itemBuilder: (ctx, index) {
                            final data = employeeList[index];
                            return Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              color: Colors.teal[200],
                              child: ListTile(
                                title: Text(
                                  data.id,
                                  style: TextStyle(color: Colors.black),
                                ),
                                leading: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: FileImage(File(data.image)),
                                ),
                                subtitle: Text(
                                  data.name,
                                  style: TextStyle(color: Colors.black),
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      EditScreen(
                                                          id: data.id,
                                                          name: data.name,
                                                          address: data.adress,
                                                          gender: data.gender,
                                                          email: data.email,
                                                          phone: data.phone,
                                                          index: index,
                                                          image: data.image)));
                                        },
                                        child: Icon(
                                          Icons.edit,
                                          color: Colors.black,
                                        )),
                                    GestureDetector(
                                        onTap: () {
                                          deleteEmployee(index);
                                        },
                                        child: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        )),
                                    DropdownButton(
                                      // Initial Value
                                      borderRadius: BorderRadius.circular(20),
                                      value: dropdownvalue,
                                      underline: Container(
                                        color: Colors.teal[300],
                                      ),
                                      // Down Arrow Icon
                                      icon: Icon(
                                        Icons.keyboard_arrow_down,
                                        color: Colors.black,
                                      ),
                                      dropdownColor: Colors.teal[300],

                                      style: TextStyle(fontSize: 7),
                                      // Array list of items
                                      items: items.map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Text(
                                            items,
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        );
                                      }).toList(),
                                      // After selecting the desired option,it will
                                      // change button value to selected value
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          dropdownvalue = newValue!;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: employeeList.length,
                        );
                      },
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
