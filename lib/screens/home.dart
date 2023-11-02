import 'package:app/Model/model.dart';
import 'package:app/db/functions.dart';
import 'package:app/screens/add.dart';
import 'package:app/screens/edit.dart';
import 'package:app/screens/settings.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  EmployeeList employee;

  HomeScreen({Key? key, required this.employee}) : super(key: key);

  List employeeList = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.grey.shade900,
          leading: Icon(
            Icons.search,
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Settings_Screen()));
                },
                child: Text(
                  "Settings",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 208, 202, 202),
        body: Center(
          child: Column(
            children: [
              Container(
                height: 270,
                width: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey.shade600,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 2,
                    ),
                    CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.grey.shade500,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text("Company name"),
                    Container(
                      height: 30,
                      width: 320,
                      color: Colors.grey.shade600,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => AddScreen()));
                              },
                              child: Text("Add")),
                          TextButton(onPressed: () {}, child: Text("Months"))
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
                    color: Colors.grey.shade700,
                  ),
                  child: Builder(builder: (context) {
                    return ValueListenableBuilder(
                      valueListenable: employeeListNotifier,
                      builder: (BuildContext ctx,
                          List<EmployeeList> employeeList, Widget? child) {
                        return ListView.builder(
                          itemBuilder: (ctx, index) {
                            final data = employeeList[index];
                            return ListTile(
                              title: Text(data.id),
                              subtitle: Text(data.name),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Edit_Screen()));
                                      },
                                      icon: Icon(Icons.edit)),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.delete)),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.expand_more))
                                ],
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

  // Row employeelist({required String name, required String number}) {
  //   return Row(
  //     children: [
  //       SizedBox(width: 10),
  //       CircleAvatar(radius: 30, backgroundColor: Colors.grey),
  //       SizedBox(width: 30),
  //       SingleChildScrollView(
  //         scrollDirection: Axis.horizontal,
  //         child: Row(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Column(
  //               children: [
  //                 Align(
  //                   alignment: Alignment.topRight,
  //                   child: Align(
  //                     alignment: Alignment.topRight,
  //                     child: Text(
  //                       name,
  //                       style: TextStyle(
  //                           fontWeight: FontWeight.bold, fontSize: 18),
  //                     ),
  //                   ),
  //                 ),
  //                 Text(
  //                   'Number: $number',
  //                   style: TextStyle(fontSize: 16),
  //                 ),
  //               ],
  //             ),
  //             SizedBox(
  //               width: 60,
  //             ),
  //             Icon(
  //               Icons.edit,
  //               color: Color.fromARGB(255, 133, 130, 130),
  //             ),
  //             SizedBox(
  //               width: 10,
  //             ),
  //             Icon(
  //               Icons.delete,
  //               color: Color.fromARGB(255, 177, 32, 21),
  //             )
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
