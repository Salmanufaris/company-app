import 'dart:io';
import 'package:app/controller/dbprovider.dart';
import 'package:app/helpers/colors.dart';
import 'package:app/view/detailscreen/detail_page.dart';
import 'package:app/view/editscreen/edit_page.dart';
import 'package:app/view/employeesbottom/widget/allscreen_filter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmployeeListScreen extends StatefulWidget {
  final String companyname;

  const EmployeeListScreen({super.key, required this.companyname});

  @override
  // ignore: library_private_types_in_public_api
  _EmployeeListScreenState createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends State<EmployeeListScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: MainColours.homebgColor[400],
          title: const Text(
            "Employee List",
          ),
          centerTitle: true,
          bottom: TabBar(
            controller: tabController,
            tabs: const [
              Tab(
                text: "All",
              ),
              Tab(text: "Best"),
              Tab(text: "Average"),
              Tab(text: "Low")
            ],
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            Allscreen(companyname: widget.companyname),
            EmployeeCategoryScreen(
                companyname: widget.companyname, category: 'Best'),
            EmployeeCategoryScreen(
                companyname: widget.companyname, category: 'Average'),
            EmployeeCategoryScreen(
                companyname: widget.companyname, category: 'Low'),
          ],
        ),
      ),
    );
  }
}

class EmployeeCategoryScreen extends StatelessWidget {
  final String companyname;
  final String category;

  const EmployeeCategoryScreen({
    super.key,
    required this.companyname,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Consumer<DbProvider>(
        builder: (ctx, value, child) {
          final filteredEmployeList = value.emploList
              .where((employee) => employee.category.contains(category))
              .toList();
          return ListView.builder(
            itemBuilder: (ctx, index) {
              final data = filteredEmployeList[index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Detailscreen(
                      categery: "",
                      catogery: data.category,
                      companyname: "",
                      name: data.name,
                      gender: data.gender,
                      email: data.email,
                      number: data.number,
                      image: data.image,
                    ),
                  ));
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Colors.lightBlueAccent[100],
                  child: ListTile(
                    title: Text(
                      data.name,
                      style: const TextStyle(color: MainColours.bgblack),
                    ),
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: FileImage(File(data.image)),
                    ),
                    subtitle: Text(
                      data.category,
                      style: const TextStyle(color: MainColours.bgred),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          data.number,
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
                              ),
                            ));
                          },
                          child: const Icon(
                            Icons.edit,
                            color: MainColours.bgblack,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            showDeleteDialog(context, index);
                          },
                          child: const Icon(
                            Icons.delete,
                            color: MainColours.bgred,
                          ),
                        ),
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
    });
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
