import 'dart:io';
import 'package:flutter/material.dart';

class Detailscreen extends StatefulWidget {
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
  });

  @override
  State<Detailscreen> createState() => _DetailscreenState();
}

class _DetailscreenState extends State<Detailscreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.orange[400],
        appBar: AppBar(
          backgroundColor: Colors.yellow[200],
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          title: const Text(
            "Detail Page",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
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
                      image: FileImage(File(widget.image)),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(19),
                    border: Border.all(
                      color: Colors.white, // Border color
                      width: 4, // Border width
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 450,
                  width: 370,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        "Name",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                        ),
                      ),
                      Text(widget.name),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
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
                        children: [Text(widget.gender), Text(widget.catogery)],
                      ),
                      SizedBox(
                        height: 120,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Email :",
                            style: TextStyle(color: Colors.red, fontSize: 20),
                          ),
                          Text(
                            "Number",
                            style: TextStyle(color: Colors.red, fontSize: 20),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [Text(widget.email), Text(widget.number)],
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
