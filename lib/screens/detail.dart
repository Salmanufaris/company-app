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
        appBar: AppBar(
          title: Text("Detail Page"),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: 10,
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
                    color: Colors.teal, // Border color
                    width: 4, // Border width
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 340, bottom: 10),
                child: Text(
                  "Name",
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 280),
                child: Text(
                  widget.name,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Gender",
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                  Text(
                    "Category",
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  )
                ],
              ),
              SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.gender,
                    style: TextStyle(fontSize: 18),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(
                      widget.catogery,
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0, bottom: 10),
                child: Text(
                  'Email',
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
              ),
              Text(
                widget.email,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Number",
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                  Text(
                    widget.number,
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
