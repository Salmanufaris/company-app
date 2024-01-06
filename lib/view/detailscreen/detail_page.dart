import 'dart:io';
import 'package:app/helpers/colors.dart';
import 'package:flutter/material.dart';

class Detailscreen extends StatelessWidget {
  final String name;
  final String gender;
  final String catogery;
  final String email;
  final String number;
  final String image;
  final String companyname;

  const Detailscreen({
    super.key,
    required this.name,
    required this.gender,
    required this.catogery,
    required this.email,
    required this.number,
    required this.image,
    required this.companyname,
    required String categery,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan[400],
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: MainColours.bgblack,
            ),
          ),
          title: const Text(
            "Detail Page",
            style: TextStyle(
              color: MainColours.bgblack,
            ),
          ),
          centerTitle: true,
        ),
        body: SizedBox(
            height: 800,
            width: 380,
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Container(
                  height: 160,
                  width: 160,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: FileImage(File(image)),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(19),
                    border: Border.all(
                      color: Colors.cyan, // Border color
                      width: 4, // Border width
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Container(
                    height: 400,
                    width: 370,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.cyan[400],
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        const Text(
                          "Name",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                          ),
                        ),
                        Text(name),
                        const SizedBox(
                          height: 30,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Gender",
                              style: TextStyle(color: Colors.red, fontSize: 20),
                            ),
                            Text(
                              "Category",
                              style: TextStyle(color: Colors.red, fontSize: 20),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [Text(gender), Text(catogery)],
                        ),
                        const SizedBox(
                          height: 120,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Email :",
                              style: TextStyle(color: Colors.red, fontSize: 20),
                            ),
                            Text(
                              "percentage%",
                              style: TextStyle(color: Colors.red, fontSize: 20),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [Text(email), Text(number)],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
