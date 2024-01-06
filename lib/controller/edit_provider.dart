import 'package:app/helpers/add_edit_image_email.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProvider extends ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();

  String dropdownvalue = ''; // Add this line
  String categoryDropdownValue = '';

  // void updateValuesFromData(EmployeeModel data) {
  //   nameController.text = data.name;
  //   genderController.text = data.gender;
  //   emailController.text = data.email;
  //   numberController.text = data.number;
  //   categoryController.text = data.category;

  //   // set other controllers...
  //   notifyListeners();
  // }

  String? pickedImage;
  bool imageUpdated = false;

  Future<void> pickImage() async {
    final picked = await Imagebringing.pickImage(ImageSource.gallery);
    if (picked != null) {
      pickedImage = picked.path;
      imageUpdated = true;
      notifyListeners();
    }
  }

  void updateImage(XFile? picked) {
    if (picked != null) {
      pickedImage = picked.path;
      imageUpdated = true;
      notifyListeners();
    }
  }

  Future<void> pickImageDialog(BuildContext context) async {
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
                  updateImage(picked);
                },
                child: const Text('Camera'),
              ),
              ElevatedButton(
                onPressed: () async {
                  Navigator.pop(context);
                  XFile? picked =
                      await Imagebringing.pickImage(ImageSource.gallery);
                  updateImage(picked);
                },
                child: const Text('Gallery'),
              ),
            ],
          ),
        );
      },
    );
    notifyListeners();
  }
}
