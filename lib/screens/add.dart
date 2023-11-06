import 'dart:io';

import 'package:app/Model/data_model.dart';
import 'package:app/db/functions.dart';

import 'package:app/widget/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddScreen extends StatefulWidget {
  AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _idController = TextEditingController();

  final _nameController = TextEditingController();

  final _adressController = TextEditingController();

  final _genderController = TextEditingController();

  final _emailController = TextEditingController();

  final _phoneController = TextEditingController();
  String dropdownvalue = 'Male';

  // List of items in our dropdown menu
  var items = [
    'Male',
    'Female',
    'others',
  ];
  String selectedvalue = "";
  XFile? pickedimage;
  // late File pickedimage;

  Future<void> _pickImage() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.teal[300],
          title: const Text('Whic one you want '),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () async {
                  Navigator.pop(context);
                  XFile? picked =
                      await Imagebringing.pickImage(ImageSource.camera);
                  setState(() {
                    pickedimage = picked;
                  });
                },
                child: const Text('Camera'),
              ),
              ElevatedButton(
                onPressed: () async {
                  Navigator.pop(context);
                  XFile? picked =
                      await Imagebringing.pickImage(ImageSource.gallery);
                  setState(() {
                    pickedimage = picked;
                  });
                },
                child: const Text('Gallery'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.teal[300],
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  height: 160,
                  width: 170,
                  color: Colors.teal[300],
                  child: GestureDetector(
                    onTap: () {
                      _pickImage();
                    },
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage: pickedimage != null
                          ? FileImage(File(pickedimage!.path))
                          : null,
                      backgroundColor: Colors.grey[200],
                      child: pickedimage == null
                          ? Icon(
                              Icons.camera_alt,
                              size: 80,
                              color: Colors.grey[800],
                            )
                          : null,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3, left: 30, right: 30),
                  child: TextFormField(
                    controller: _idController,
                    decoration: InputDecoration(
                        hintText: 'Id',
                        fillColor: const Color.fromARGB(255, 231, 230, 230),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
                  child: TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                        hintText: 'Full Name',
                        fillColor: Color.fromARGB(255, 231, 230, 230),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
                  child: TextFormField(
                    controller: _adressController,
                    decoration: InputDecoration(
                        hintText: 'Adress',
                        fillColor: Color.fromARGB(255, 231, 230, 230),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                DropdownButton(
                  // Initial Value
                  underline: Container(
                    color: Colors.teal,
                  ),
                  value: dropdownvalue,
                  dropdownColor: Colors.teal[300],
                  borderRadius: BorderRadius.circular(40),

                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                      _genderController.text = newValue;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
                  child: TextFormField(
                    controller: _genderController,
                    decoration: InputDecoration(
                        hintText: selectedvalue,
                        labelText: "Gender",
                        fillColor: Color.fromARGB(255, 231, 230, 230),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 30, right: 30),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                          hintText: 'Email',
                          fillColor: Color.fromARGB(255, 231, 230, 230),
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    )),
                Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 30, right: 30),
                    child: TextFormField(
                      controller: _phoneController,
                      decoration: InputDecoration(
                          hintText: 'phone',
                          fillColor: Color.fromARGB(255, 231, 230, 230),
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    )),
                ElevatedButton.icon(
                    onPressed: () {
                      onAddStudentButtonClicked(context);
                    },
                    icon: Icon(Icons.add),
                    label: Text('Add', style: TextStyle(color: Colors.amber)))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onAddStudentButtonClicked(BuildContext context) async {
    final _id = _idController.text.trim();
    final _name = _nameController.text.trim();
    final _adress = _adressController.text.trim();
    final _gender = _genderController.text.trim();
    final _email = _emailController.text.trim();
    final _phone = _phoneController.text.trim();

    if (_id.isEmpty ||
        _name.isEmpty ||
        _gender.isEmpty ||
        _email.isEmpty ||
        _phone.isEmpty) {
      return;
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => BottomBar1()),
      );
    }

    final _employee = EmployeeModel(
      id: _id,
      name: _name,
      adress: _adress,
      gender: _gender,
      email: _email,
      phone: _phone,
      image: pickedimage?.path ?? '',
    );

    addEmployee(_employee);
  }
}

class Imagebringing {
  static Future<XFile?> pickImage(ImageSource source) async {
    final ImagePicker imagePicker = ImagePicker();
    final picked = await imagePicker.pickImage(source: source);
    return picked;
  }
}
