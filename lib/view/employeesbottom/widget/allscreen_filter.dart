import 'dart:io';
import 'package:app/controller/dbprovider.dart';
import 'package:app/controller/filter_provider.dart';
import 'package:app/helpers/colors.dart';
import 'package:app/view/detailscreen/detail_page.dart';
import 'package:app/view/editscreen/edit_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Allscreen extends StatefulWidget {
  final String companyname;

  const Allscreen({super.key, required this.companyname});

  @override
  State<Allscreen> createState() => _AllscreenState();
}

class _AllscreenState extends State<Allscreen> {
  @override
  void initState() {
    var provide = Provider.of<Filterprovider>(context, listen: false);
    provide.filterThings = provide.things;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provi = Provider.of<Filterprovider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: MainColours.bgwhite,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: MainColours.bgwhite,
          title: Padding(
            padding: const EdgeInsets.only(right: 200),
            child: TextFormField(
              controller: provi.searchController,
              onChanged: (value) {
                provi.filterEmployees(
                  Provider.of<DbProvider>(context, listen: false).emploList,
                  value,
                );
              },
              decoration: const InputDecoration(
                hintText: "Search...",
              ),
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ),
        body: Consumer<Filterprovider>(
          builder: (ctx, value, child) {
            return provi.filteredEmployeeList.isEmpty
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
                : buildListView();
          },
        ),
      ),
    );
  }

  buildListView() {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        final data = Provider.of<Filterprovider>(context, listen: false)
            .filteredEmployeeList[index];
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
                  categery: data.category,
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
      itemCount: Provider.of<Filterprovider>(context, listen: false)
          .filteredEmployeeList
          .length,
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
                style: TextStyle(color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {
                Provider.of<DbProvider>(context, listen: false)
                    .deleteemployee(index);

                Navigator.of(context).pop();
              },
              child: const Text("Yes", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
}
