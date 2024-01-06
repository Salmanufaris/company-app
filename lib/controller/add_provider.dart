import 'package:app/Model/data_model.dart';
import 'package:app/controller/dbprovider.dart';
import 'package:app/widget/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddProvider extends ChangeNotifier {
  final formkey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final genderController = TextEditingController();
  final emailController = TextEditingController();
  final numberController = TextEditingController();
  final categoryController = TextEditingController();
  XFile? pickedimage;
  final String companyname;

  AddProvider({required this.companyname, this.pickedimage});
  Future<void> pickImage(BuildContext context) async {
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
                      await ImagePicker().pickImage(source: ImageSource.camera);
                  pickedimage = picked;
                  notifyListeners();
                },
                child: const Text('Camera'),
              ),
              ElevatedButton(
                onPressed: () async {
                  Navigator.pop(context);
                  XFile? picked = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  pickedimage = picked;
                  notifyListeners();
                },
                child: const Text('Gallery'),
              ),
            ],
          ),
        );
      },
    );
  }

  void resetState() {
    nameController.clear();
    genderController.clear();
    emailController.clear();
    numberController.clear();
    categoryController.clear();
    pickedimage = null;
    notifyListeners();
  }

  Future<void> onAddStudentButtonClicked(BuildContext context) async {
    final prd = Provider.of<AddProvider>(context, listen: false);
    final name = prd.nameController.text.trim();
    final gender = prd.genderController.text.trim();
    final email = prd.emailController.text.trim();
    final number = prd.numberController.text.trim();
    final category = prd.categoryController.text.trim();

    if (name.isEmpty ||
        gender.isEmpty ||
        email.isEmpty ||
        number.isEmpty ||
        category.isEmpty) {
      return;
    }

    final employee = EmployeeModel(
      name: name,
      gender: gender,
      email: email,
      number: number,
      category: category,
      image: prd.pickedimage?.path ?? '',
    );
    Provider.of<DbProvider>(context, listen: false).addEmployee(employee);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BottomBar1(
          companyname: companyname,
        ),
      ),
    );
    notifyListeners();
  }
}
