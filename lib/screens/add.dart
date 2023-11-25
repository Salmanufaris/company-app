import 'dart:io';
import 'package:app/Model/data_model.dart';
import 'package:app/db/functions.dart';
import 'package:app/screens/sub/dropdown_things.dart';
import 'package:app/screens/sub/add_edit_image_email.dart';
import 'package:app/widget/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class AddScreen extends StatefulWidget {
  final String companyname;
  AddScreen({Key? key, required this.companyname}) : super(key: key);
  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _nameController = TextEditingController();
  final _genderController = TextEditingController();
  final _emailController = TextEditingController();
  final _numberController = TextEditingController();
  final _categoryController = TextEditingController();

  XFile? pickedimage;
  final _formkey = GlobalKey<FormState>();

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
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
            child: Form(
                key: _formkey,
                child: Column(children: [
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
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 4),
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
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'[a-z]')), // Allow only numeric characters
                      ],
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
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
                              dropdownColor: Colors.white,
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
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, bottom: 5, top: 5),
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
                          prefixIcon: const Icon(Icons.email),
                          hintText: "Email",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Field is empty";
                        }
                        String phoneNumber = value.trim();
                        if (!RegExp(r'^[6789]\d{9}$').hasMatch(phoneNumber)) {
                          return 'Please enter a valid Indian mobile number';
                        }
                        return null;
                      },
                      controller: _numberController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.phone),
                        hintText: "+91",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      maxLength: 10,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        "Select Category",
                        style: TextStyle(color: Colors.red),
                      ),
                      DropdownButton(
                        iconEnabledColor: Colors.red,
                        underline: Container(
                          color: Colors.white,
                        ),
                        value: categoryDropdownValue,
                        dropdownColor: Colors.white,
                        borderRadius: BorderRadius.circular(40),
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: categoryItems.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(
                              items,
                              style: const TextStyle(color: Colors.red),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            categoryDropdownValue = newValue!;
                            _categoryController.text = newValue!;
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
                  const SizedBox(
                    height: 26,
                  ),
                  MaterialButton(
                      color: Colors.black,
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          onAddStudentButtonClicked(context);
                        }
                      },
                      child: const Text(
                        "Add",
                        style: TextStyle(color: Colors.white),
                      )),
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
        MaterialPageRoute(
            builder: (context) => BottomBar1(
                  updatedImage: "",
                  companyname: widget.companyname,
                )),
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
