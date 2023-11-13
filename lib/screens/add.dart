import 'dart:io';
import 'package:app/Model/data_model.dart';
import 'package:app/db/functions.dart';
import 'package:app/widget/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class AddScreen extends StatefulWidget {
  AddScreen({Key? key}) : super(key: key);
  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _nameController = TextEditingController();
  final _genderController = TextEditingController();
  final _emailController = TextEditingController();
  final _numberController = TextEditingController();
  final _categoryController = TextEditingController();

  String categoryDropdownValue = 'Best';
  var categoryItems = [
    'Best',
    'Average',
    'Low',
  ];

  String dropdownvalue = 'Male';
  var items = [
    'Male',
    'Female',
    'others',
  ];
  String selectedvalue = "";
  XFile? pickedimage;
  final _formkey = GlobalKey<FormState>();
  String email = 'test@example.com';

  Future<void> _pickImage() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
            child: Form(
                key: _formkey,
                child: Column(children: [
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
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
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 4),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "field is empty";
                        }
                      },
                      controller: _nameController,
                      decoration: InputDecoration(
                          hintText: "Name",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 4,
                      left: 20,
                      right: 20,
                    ),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "field is empty";
                        }
                      },
                      controller: _genderController,
                      decoration: InputDecoration(
                          prefix: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              iconEnabledColor: Colors.black,
                              underline: Container(
                                color: Colors.white,
                              ),
                              value: dropdownvalue,
                              dropdownColor: Colors.teal[300],
                              borderRadius: BorderRadius.circular(40),
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: items.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownvalue = newValue!;
                                  _genderController.text = newValue;
                                });
                              },
                            ),
                          ),
                          hintText: "click here to select gender",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 20, right: 20, bottom: 5, top: 5),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "field is empty";
                        } else if (!value.isValidEmail()) {
                          return "Invalid email format";
                        }
                      },
                      controller: _emailController,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          hintText: "Email",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "field is empty";
                        }
                      },
                      controller: _numberController,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.phone),
                          hintText: "+91",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                      maxLength: 10,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'[0-9]')), // Allow only numeric characters
                      ],
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Select Category",
                        style: TextStyle(color: Colors.red),
                      ),
                      DropdownButton(
                        iconEnabledColor: Colors.red,
                        underline: Container(
                          color: Colors.white,
                        ),
                        value: categoryDropdownValue,
                        dropdownColor: Colors.teal[300],
                        borderRadius: BorderRadius.circular(40),
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: categoryItems.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(
                              items,
                              style: TextStyle(color: Colors.red),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            categoryDropdownValue = newValue!;
                            _categoryController.text = newValue!;
                            // You can perform any other actions here when the value changes
                          });
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
                  SizedBox(
                    height: 26,
                  ),
                  MaterialButton(
                      color: Colors.green,
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          onAddStudentButtonClicked(context);
                        }
                      },
                      child: Text("Add")),
                ]))),
      ),
    ));
  }

  Future<void> onAddStudentButtonClicked(BuildContext context) async {
    final _name = _nameController.text.trim();
    final _gender = _genderController.text.trim();
    final _email = _emailController.text.trim();
    final _number = _numberController.text.trim();
    final _category = _categoryController.text.trim();

    if (_name.isEmpty ||
        _gender.isEmpty ||
        _email.isEmpty ||
        _number.isEmpty ||
        _category.isEmpty) {
      return;
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => BottomBar1()),
      );
    }
    final _employee = EmployeeModel(
      name: _name,
      gender: _gender,
      email: _email,
      number: _number,
      category: _category,
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

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}
