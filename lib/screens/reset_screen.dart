import 'package:app/widget/bottombar.dart';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';

Future<void> resetAndClearData(BuildContext context) async {
  // ignore: unused_local_variable, prefer_typing_uninitialized_variables
  var companyname;
  // ignore: unused_local_variable
  bool confirmReset = await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Text(
          "Confirm Reset",
          style: TextStyle(color: Color.fromARGB(255, 255, 0, 0)),
        ),
        content: const Text(
          "This will reset the App. Your data will  clear. Do you want to continue?",
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text(
              "Cancel",
              style: TextStyle(color: Color.fromARGB(255, 5, 5, 5)),
            ),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
          TextButton(
            child: const Text(
              "Reset",
              style: TextStyle(color: Color.fromARGB(255, 245, 0, 0)),
            ),
            onPressed: () async {
              await Hive.close();
              await Hive.deleteBoxFromDisk('employee_db');

              // ignore: use_build_context_synchronously
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                    builder: (context) => const BottomBar1(
                          companyname: "",
                          updatedImage: "",
                        )),
              );
            },
          ),
        ],
      );
    },
  );
}
