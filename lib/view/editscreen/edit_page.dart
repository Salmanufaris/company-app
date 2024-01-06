import 'dart:io';
import 'package:app/controller/dbprovider.dart';
import 'package:app/controller/edit_provider.dart';
import 'package:app/helpers/add_edit_image_email.dart';
import 'package:app/helpers/colors.dart';
import 'package:app/helpers/dropdown_things.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app/Model/data_model.dart';
import 'package:app/widget/bottombar.dart';
import 'package:provider/provider.dart';

class EditScreen extends StatefulWidget {
  final String name, gender, email, number, category, image, companyname;
  final int index;

  const EditScreen({
    super.key,
    required this.name,
    required this.gender,
    required this.email,
    required this.number,
    required this.category,
    required this.image,
    required this.index,
    required this.companyname,
  });

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  @override
  void initState() {
    final pro = Provider.of<EditProvider>(context, listen: false);
    pro.nameController.text = widget.name;
    pro.categoryController.text = widget.category;
    pro.genderController.text = widget.gender;
    pro.emailController.text = widget.email;
    pro.numberController.text = widget.number;
    pro.pickedImage = widget.image;
    super.initState();
  }

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<EditProvider>(context, listen: false);

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
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: MainColours.bgwhite,
        body: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      pro.pickImageDialog(context);
                    },
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage: pro.pickedImage != null
                          ? FileImage(File(pro.pickedImage!))
                          : FileImage(File(widget.image)),
                      backgroundColor: Colors.grey[200],
                      child: pro.pickedImage == null
                          ? Icon(
                              Icons.camera_alt,
                              size: 80,
                              color: Colors.grey[800],
                            )
                          : null,
                    ),
                  ),
                  _buildTextFormField(
                    controller: pro.nameController,
                    hintText: "Name",
                    validator: (value) => value == null || value.isEmpty
                        ? "Field is empty"
                        : null,
                  ),
                  _buildTextFormField(
                    controller: pro.genderController,
                    hintText: "Click here to select gender",
                    prefix: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        iconEnabledColor: Colors.black,
                        underline: Container(color: MainColours.bgwhite),
                        value: dropdownvalue,
                        borderRadius: BorderRadius.circular(40),
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: items.map((String item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          dropdownvalue = newValue!;
                          pro.genderController.text = newValue;
                        },
                      ),
                    ),
                    validator: (value) => value == null || value.isEmpty
                        ? "Field is empty"
                        : null,
                  ),
                  _buildTextFormField(
                    controller: pro.emailController,
                    hintText: "Email",
                    prefixIcon: const Icon(Icons.email),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Field is empty";
                      } else if (!value.isValidEmail()) {
                        return "Invalid email format";
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      controller: pro.numberController,
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
                        style: TextStyle(color: Colors.red),
                      ),
                      DropdownButton(
                        iconEnabledColor: Colors.red,
                        underline: Container(color: MainColours.bgwhite),
                        value: categoryDropdownValue,
                        borderRadius: BorderRadius.circular(40),
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: categoryItems.map((String item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(color: Colors.red),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          categoryDropdownValue = newValue!;
                          pro.categoryController.text = newValue;
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 26, right: 140),
                    child: TextFormField(
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintText: categoryDropdownValue,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  MaterialButton(
                    color: Colors.black,
                    onPressed: () async {
                      updateEmployee();
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String hintText,
    Widget? prefixIcon,
    Widget? prefix,
    int? maxLength,
    List<TextInputFormatter>? inputFormatters,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: TextFormField(
        controller: controller,
        maxLength: maxLength,
        inputFormatters: inputFormatters,
        keyboardType: keyboardType,
        validator: validator,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          prefix: prefix,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  void updateEmployee() async {
    final pro = Provider.of<EditProvider>(context,
        listen: false); // Get the EditProvider
    final editedName = pro.nameController.text.trim();
    final editedCategory = pro.categoryController.text.trim();
    final editedGender = pro.genderController.text.trim();
    final editedEmail = pro.emailController.text.trim();
    final editedNumber = pro.numberController.text.trim();

    String updatedImage = pro.pickedImage ?? widget.image;
    if (pro.imageUpdated && pro.pickedImage != null) {
      updatedImage = pro.pickedImage!;
    }

    if (_formkey.currentState?.validate() ?? false) {
      final updatedEmployee = EmployeeModel(
        name: editedName,
        gender: editedGender,
        email: editedEmail,
        number: editedNumber,
        category: editedCategory,
        image: updatedImage,
        index: widget.index,
      );

      if (_isEmployeeChanged(updatedEmployee)) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Updated Successfully',
              style: TextStyle(color: Colors.black),
            ),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.cyan,
          ),
        );

        // Call the update method from DbProvider
        await Provider.of<DbProvider>(context, listen: false)
            .editemployee(widget.index, updatedEmployee);

        // Navigate to the BottomBar1 screen
        // ignore: use_build_context_synchronously
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => BottomBar1(
              companyname: widget.companyname,
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'No changes made',
              style: TextStyle(color: Colors.black),
            ),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.cyan,
          ),
        );
      }
    }
  }

  bool _isEmployeeChanged(EmployeeModel updatedEmployee) {
    return updatedEmployee.name != widget.name ||
        updatedEmployee.gender != widget.gender ||
        updatedEmployee.email != widget.email ||
        updatedEmployee.number != widget.number ||
        updatedEmployee.category != widget.category ||
        updatedEmployee.image != widget.image;
  }
}
