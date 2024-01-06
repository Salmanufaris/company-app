// ignore_for_file: prefer_const_constructors_in_immutables

import 'dart:io';
import 'package:app/controller/add_provider.dart';
import 'package:app/helpers/colors.dart';
import 'package:app/helpers/dropdown_things.dart';
import 'package:app/helpers/add_edit_image_email.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class AddScreen extends StatelessWidget {
  final String companyname;
  AddScreen({super.key, required this.companyname});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: MainColours.bgwhite,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: MainColours.bgblack,
            )),
      ),
      backgroundColor: MainColours.bgwhite,
      body: SingleChildScrollView(
        child: Center(
            child: Consumer<AddProvider>(
          builder: (context, value, child) => Form(
              key: value.formkey,
              child: Column(children: [
                GestureDetector(
                  onTap: () {
                    value.pickImage(context);
                  },
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: value.pickedimage != null
                        ? FileImage(File(value.pickedimage!.path))
                        : null,
                    backgroundColor: Colors.grey[200],
                    child: value.pickedimage == null
                        ? Icon(
                            Icons.camera_alt,
                            size: 80,
                            color: Colors.grey[800],
                          )
                        : null,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 4),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "field is empty";
                      }
                      return null;
                    },
                    controller: value.nameController,
                    decoration: InputDecoration(
                        hintText: "Name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'[a-z]')), // Allow only numeric characters
                    ],
                    keyboardType: TextInputType.text,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4, left: 20, right: 20),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "field is empty";
                      }
                      return null;
                    },
                    controller: value.genderController,
                    decoration: InputDecoration(
                        prefix: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            iconEnabledColor: MainColours.bgblack,
                            underline: Container(
                              color: MainColours.bgwhite,
                            ),
                            value: dropdownvalue,
                            dropdownColor: MainColours.bgwhite,
                            borderRadius: BorderRadius.circular(40),
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              dropdownvalue = newValue!;
                              value.genderController.text = newValue;
                            },
                          ),
                        ),
                        hintText: "click here to select gender",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, bottom: 5, top: 5),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "field is empty";
                      } else if (!value.isValidEmail()) {
                        return "Invalid email format";
                      }
                      return null;
                    },
                    controller: value.emailController,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email),
                        hintText: "Email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    controller: value.numberController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.percent),
                      hintText: "percentage",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a percentage';
                      }
                      double enteredValue =
                          double.tryParse(value.replaceAll('%', '')) ?? -1;

                      if (enteredValue < 0 || enteredValue > 100) {
                        return 'Please enter a valid percentage between 0% and 100%';
                      }
                      return null;
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "Select Category",
                      style: TextStyle(color: MainColours.bgred),
                    ),
                    DropdownButton(
                      iconEnabledColor: MainColours.bgred,
                      underline: Container(
                        color: MainColours.bgwhite,
                      ),
                      value: categoryDropdownValue,
                      dropdownColor: MainColours.bgwhite,
                      borderRadius: BorderRadius.circular(40),
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: categoryItems.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(
                            items,
                            style: const TextStyle(color: MainColours.bgred),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        // setState(() {
                        categoryDropdownValue = newValue!;
                        value.categoryController.text = newValue;
                        // });
                      },
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 26, right: 140),
                  child: TextFormField(
                    maxLines: 3,
                    decoration: InputDecoration(
                        hintText: categoryDropdownValue,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                const SizedBox(
                  height: 26,
                ),
                MaterialButton(
                    color: MainColours.bgblack,
                    onPressed: () {
                      if (value.formkey.currentState!.validate()) {
                        value.onAddStudentButtonClicked(context);
                        value.resetState();
                      }
                    },
                    child: const Text(
                      "Add",
                      style: TextStyle(color: Colors.white),
                    )),
              ])),
        )),
      ),
    ));
  }
}
