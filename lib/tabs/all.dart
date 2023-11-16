import 'dart:io';
import 'package:app/Model/data_model.dart';
import 'package:app/db/functions.dart';
import 'package:app/screens/detail.dart';
import 'package:app/screens/edit.dart';
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
          title: Text(
            "search here",
            style: TextStyle(fontSize: 15),
          ),
          leading: IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: EmployeeSearchDelegate(filteredEmployeeList),
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

                return ListView.builder(
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
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.black,
                                ),
                              ),
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

class EmployeeSearchDelegate extends SearchDelegate {
  final List<EmployeeModel> employeeList;

  EmployeeSearchDelegate(this.employeeList);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.clear,
          color: Colors.black,
        ),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildSearchResults(query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildSearchResults(query);
  }

  Widget _buildSearchResults(String query) {
    final List<EmployeeModel> searchResults = employeeList
        .where((employee) =>
            employee.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        final data = searchResults[index];
        final originalIndex = employeeList.indexOf(data);

        return ListTile(
          title: Text(
            data.name,
            style: TextStyle(color: Colors.black),
          ),
          subtitle: Text(
            data.category,
            style: TextStyle(color: Colors.red),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Detailscreen(
                  companyname: "", // Provide the appropriate value
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
        );
      },
    );
  }
}
