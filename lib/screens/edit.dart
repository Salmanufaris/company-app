import 'dart:io';

import 'package:app/Model/data_model.dart';
import 'package:app/db/functions.dart';
import 'package:app/widget/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditScreen extends StatefulWidget {
  final String id;
  final String name;
  final String address;
  final String gender;
  final String email;
  final String phone;
  final String image;
  final int index;

  EditScreen({
    Key? key,
    required this.id,
    required this.name,
    required this.address,
    required this.gender,
    required this.email,
    required this.phone,
    required this.image,
    required this.index,
  }) : super(key: key);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController _idController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  String? pickedImage;

  @override
  void initState() {
    _idController.text = widget.id;
    _nameController.text = widget.name;
    _addressController.text = widget.address;
    _genderController.text = widget.gender;
    _emailController.text = widget.email;
    _phoneController.text = widget.phone;

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

  String dropdownvalue = 'Male';

  var items = [
    'Male',
    'Female',
    'others',
  ];
  String selectedvalue = "";

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
                    onTap: _pickImage,
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage: pickedImage != null
                          ? FileImage(File(pickedImage!))
                          : null,
                      backgroundColor: Colors.grey[200],
                      child: pickedImage == null
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
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3, left: 30, right: 30),
                  child: TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: 'Full Name',
                      fillColor: const Color.fromARGB(255, 231, 230, 230),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3, left: 30, right: 30),
                  child: TextFormField(
                    controller: _addressController,
                    decoration: InputDecoration(
                      hintText: 'Adress',
                      fillColor: const Color.fromARGB(255, 231, 230, 230),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                DropdownButton(
                  underline: Container(
                    color: Colors.teal,
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
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        hintText: selectedvalue,
                        labelText: "Email",
                        fillColor: Color.fromARGB(255, 231, 230, 230),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
                  child: TextFormField(
                    controller: _phoneController,
                    decoration: InputDecoration(
                        hintText: selectedvalue,
                        labelText: "Number",
                        fillColor: Color.fromARGB(255, 231, 230, 230),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    _updateEmployee();
                  },
                  icon: Icon(Icons.add),
                  label: Text(
                    'Update',
                    style: TextStyle(color: Colors.amber),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _updateEmployee() {
    final editedId = _idController.text.trim();
    final editedName = _nameController.text.trim();
    final editedAddress = _addressController.text.trim();
    final editedGender = _genderController.text.trim();
    final editedEmail = _emailController.text.trim();
    final editedPhone = _phoneController.text.trim();

    if (editedId.isEmpty ||
        editedName.isEmpty ||
        editedAddress.isEmpty ||
        editedGender.isEmpty ||
        editedEmail.isEmpty ||
        editedPhone.isEmpty ||
        pickedImage == null) {
      // Handle empty fields
      return;
    }

    final updatedEmployee = EmployeeModel(
      id: editedId,
      name: editedName,
      adress: editedAddress,
      gender: editedGender,
      email: editedEmail,
      phone: editedPhone,
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

    editEmployee(widget.index, updatedEmployee);
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
