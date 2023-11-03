// ignore_for_file: prefer_final_fields

import 'package:app/Model/data_model.dart';
import 'package:app/db/functions.dart';

import 'package:app/widget/bottombar.dart';
import 'package:flutter/material.dart';

class EditScreen extends StatefulWidget {
  final String id;
  final String name;
  final String adress;
  final String gender;
  final String email;
  final String phone;
  int index;

  EditScreen(
      {Key? key,
      required this.id,
      required this.name,
      required this.adress,
      required this.gender,
      required this.email,
      required this.phone,
      required this.index})
      : super(key: key);

  @override
  State<EditScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<EditScreen> {
  TextEditingController _idController = TextEditingController();

  TextEditingController _nameController = TextEditingController();

  TextEditingController _adressController = TextEditingController();

  TextEditingController _genderController = TextEditingController();

  TextEditingController _emailController = TextEditingController();

  TextEditingController _phoneController = TextEditingController();
  @override
  void initState() {
    _idController.text = widget.id;
    _nameController.text = widget.name;
    _adressController.text = widget.adress;
    _genderController.text = widget.gender;
    _emailController.text = widget.email;
    _phoneController.text = widget.phone;
    super.initState();
  }

  String dropdownvalue = 'Male';

  // List of items in our dropdown menu
  var items = [
    'Male',
    'Female',
    'others',
  ];
  String selectedvalue = "";

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
              CircleAvatar(
                radius: 80,
              ),
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
                dropdownColor: Colors.grey,
                borderRadius: BorderRadius.circular(40),
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
                    update();
                  },
                  icon: Icon(Icons.save),
                  label: Text('Save', style: TextStyle(color: Colors.amber)))
            ],
          ),
        ),
      ),
    );
  }

  update() async {
    final edited_id = _idController.text.trim();
    final edited_name = _nameController.text.trim();
    final edited_adress = _adressController.text.trim();
    final edited_gender = _genderController.text.trim();
    final edited_email = _emailController.text.trim();
    final edited_phone = _phoneController.text.trim();

    if (edited_id.isEmpty ||
        edited_name.isEmpty ||
        edited_adress.isEmpty ||
        edited_gender.isEmpty ||
        edited_email.isEmpty ||
        edited_phone.isEmpty) {
      return;
    }
    final updated = EmployeeModel(
        id: edited_name,
        name: edited_name,
        adress: edited_adress,
        gender: edited_gender,
        email: edited_email,
        phone: edited_phone);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        'Updated Successfully',
        style: TextStyle(color: Colors.black),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.white,
    ));
    editEmployee(widget.index, updated);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => BottomBar1()));
  }
}
