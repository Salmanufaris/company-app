import 'dart:html';

import 'package:app/screens/sub/add_edit_image_email.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class camera extends StatefulWidget {
  const camera({super.key});

  @override
  State<camera> createState() => _cameraState();
}

class _cameraState extends State<camera> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

XFile? pickedimage;
Future<void> _pickImage() async {
  var context;
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
