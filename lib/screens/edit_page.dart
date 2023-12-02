import 'dart:io';
import 'package:app/screens/sub/dropdown_things.dart';
import 'package:app/screens/sub/add_edit_image_email.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:app/Model/data_model.dart';
import 'package:app/db/functions.dart';
import 'package:app/widget/bottombar.dart';

class EditScreen extends StatefulWidget {
  final String name, gender, email, number, category, image, companyname;
  final int index;

  const EditScreen({
    Key? key,
    required this.name,
    required this.gender,
    required this.email,
    required this.number,
    required this.category,
    required this.image,
    required this.index,
    required this.companyname,
  }) : super(key: key);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  String? pickedImage;
  bool imageUpdated = false;

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

  // ignore: unused_element
  Future<void> _pickImage() async {
    final picked = await Imagebringing.pickImage(ImageSource.gallery);
    if (picked != null) {
      setState(() {
        pickedImage = picked.path;
        imageUpdated = true;
      });
    }
  }

  Future<void> _pickImageDialog() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text('Which one do you want?'),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () async {
                  Navigator.pop(context);
                  XFile? picked =
                      await Imagebringing.pickImage(ImageSource.camera);
                  _updateImage(picked);
                },
                child: const Text('Camera'),
              ),
              ElevatedButton(
                onPressed: () async {
                  Navigator.pop(context);
                  XFile? picked =
                      await Imagebringing.pickImage(ImageSource.gallery);
                  _updateImage(picked);
                },
                child: const Text('Gallery'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _updateImage(XFile? picked) {
    if (picked != null) {
      setState(() {
        pickedImage = picked.path;
        imageUpdated = true;
      });
    }
  }

  final _formkey = GlobalKey<FormState>();
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
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: _pickImageDialog,
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage: pickedImage != null
                          ? FileImage(File(pickedImage!))
                          : FileImage(File(widget.image)),
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
                  _buildTextFormField(
                    controller: _nameController,
                    hintText: "Name",
                    validator: (value) => value == null || value.isEmpty
                        ? "Field is empty"
                        : null,
                  ),
                  _buildTextFormField(
                    controller: _genderController,
                    hintText: "Click here to select gender",
                    prefix: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        iconEnabledColor: Colors.black,
                        underline: Container(color: Colors.white),
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
                          setState(() {
                            dropdownvalue = newValue!;
                            _genderController.text = newValue;
                          });
                        },
                      ),
                    ),
                    validator: (value) => value == null || value.isEmpty
                        ? "Field is empty"
                        : null,
                  ),
                  _buildTextFormField(
                    controller: _emailController,
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
                      controller: _numberController,
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
                        underline: Container(color: Colors.white),
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
                          setState(() {
                            categoryDropdownValue = newValue!;
                            _categoryController.text = newValue;
                          });
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
                    onPressed: _updateEmployee,
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

  void _updateEmployee() {
    final editedName = _nameController.text.trim();
    final editedCategory = _categoryController.text.trim();
    final editedGender = _genderController.text.trim();
    final editedEmail = _emailController.text.trim();
    final editedNumber = _numberController.text.trim();

    String updatedImage = pickedImage ?? widget.image;

    if (imageUpdated && pickedImage != null) {
      updatedImage = pickedImage!;
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

        editemployee(widget.index, updatedEmployee);

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => BottomBar1(
              companyname: widget.companyname,
              updatedImage: widget.image,
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
