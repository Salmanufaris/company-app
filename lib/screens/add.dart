import 'dart:io';

import 'package:app/Model/model.dart';
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
  XFile? pickedImage;

  Future<void> _pickImage() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pick Image From...'),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () async {
                  Navigator.pop(context);
                  XFile? picked =
                      await ImageUtils.pickImage(ImageSource.camera);
                  setState(() {
                    pickedImage = picked;
                  });
                },
                child: const Text('Camera'),
              ),
              ElevatedButton(
                onPressed: () async {
                  Navigator.pop(context);
                  XFile? picked =
                      await ImageUtils.pickImage(ImageSource.gallery);
                  setState(() {
                    pickedImage = picked;
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
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () {
                  radius:
                  100;
                  backgroundImage:
                  pickedImage != null
                      ? FileImage(File(pickedImage!.path))
                      : null;
                  backgroundColor:
                  Colors.grey[200];
                  child:
                  pickedImage == null
                      ? Icon(
                          Icons.camera_alt,
                          size: 80,
                          color: Colors.grey[800],
                        )
                      : null;
                },
                child: CircleAvatar(
                  radius: 80,
                ),
              ),
              Text("Profile name"),
              SizedBox(
                height: 10,
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
                value: dropdownvalue,

                // Down Arrow Icon
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
                  padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
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
                  padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
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
                  label: Text('save'))
            ],
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
      final employee = (
        id: _id,
        number: _name,
        adress: _adress,
        gender: _gender,
        email: _email,
        phone: _phone
      );
      Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => BottomBar1(
                  employee: EmployeeList(
                      id: '',
                      name: '',
                      adress: '',
                      gender: "",
                      email: "",
                      phone: ""),
                )),
      );
    }
    print('$_id $_name');
    final _employee = EmployeeList(
        id: _id,
        name: _name,
        adress: _adress,
        gender: _gender,
        email: _email,
        phone: _phone);

    addEmployee(_employee);
  }
}

class ImageUtils {
  static Future<XFile?> pickImage(ImageSource source) async {
    final ImagePicker imagePicker = ImagePicker();
    final picked = await imagePicker.pickImage(source: source);
    return picked;
  }
}
