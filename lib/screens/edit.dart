import 'dart:io';
import 'package:app/Model/data_model.dart';
import 'package:app/db/functions.dart';
import 'package:app/widget/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditScreen extends StatefulWidget {
  final String name;

  final String gender;
  final String email;
  final String number;
  final String category;
  final String image;
  final int index;
  EditScreen({
    Key? key,
    required this.name,
    required this.gender,
    required this.email,
    required this.number,
    required this.category,
    required this.image,
    required this.index,
  }) : super(key: key);
  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _numberController = TextEditingController();
  TextEditingController _categoryController = TextEditingController();
  String? pickedImage;
  @override
  void initState() {
    _nameController.text = widget.name;
    _categoryController.text = widget.category;
    _genderController.text = widget.gender;
    _emailController.text = widget.email;
    _numberController.text = widget.number;
    pickedImage = widget.image;
    super.initState();
  }

  Future<void> _pickImage() async {
    final picked = await Imagebringing.pickImage(ImageSource.gallery);
    if (picked != null) {
      setState(() {
        pickedImage = picked.path;
      });
    }
  }

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

  Future<void> _pickimage() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // backgroundColor: Colors.teal[300],
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
                      _pickimage();
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
                    padding: EdgeInsets.only(
                        left: 20, right: 20, bottom: 5, top: 10),
                    child: TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                          hintText: "Name",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 10,
                      left: 20,
                      right: 20,
                    ),
                    child: TextFormField(
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
                    padding: EdgeInsets.only(
                        left: 20, right: 20, bottom: 5, top: 10),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          hintText: "Email",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: TextFormField(
                      controller: _numberController,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.phone),
                          hintText: "Number",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
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
                        _updateEmployee();
                      },
                      child: Text("Add")),
                ]))),
      ),
    ));
  }

  void _updateEmployee() {
    final editedname = _nameController.text.trim();
    final editedcategory = _categoryController.text.trim();
    final editedGender = _genderController.text.trim();
    final editedEmail = _emailController.text.trim();
    final editednumber = _numberController.text.trim();
    if (editedname.isEmpty ||
        editedGender.isEmpty ||
        editedEmail.isEmpty ||
        editednumber.isEmpty ||
        editedcategory.isEmpty ||
        pickedImage == null) {
      return;
    }
    final updatedEmployee = EmployeeModel(
      name: editedname,
      gender: editedGender,
      email: editedEmail,
      number: editednumber,
      category: editedcategory,
      image: pickedImage!,
    );
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        'Updated Successfully',
        style: TextStyle(color: Colors.white),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.black,
    ));
    editemployee(widget.index, updatedEmployee);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => BottomBar1()));
  }
}

class Imagebringing {
  static Future<XFile?> pickImage(ImageSource source) async {
    final ImagePicker imagePicker = ImagePicker();
    final picked = await imagePicker.pickImage(source: source);
    return picked;
  }
}
