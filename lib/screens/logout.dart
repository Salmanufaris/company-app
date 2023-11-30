import 'package:hive/hive.dart';
import 'package:app/screens/loginpage.dart';
import 'package:flutter/material.dart';

Future<void> logoutAndClearData(BuildContext context) async {
  bool confirmLogout = await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Text(
          "Confirm Logout",
          style: TextStyle(color: Color.fromARGB(255, 255, 0, 0)),
        ),
        content: const Text(
          "This will logout the App. Your data will be cleared. Do you want to continue?",
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
              "Logout",
              style: TextStyle(color: Color.fromARGB(255, 245, 0, 0)),
            ),
            onPressed: () async {
              // Close all open Hive boxes
              await Hive.close();

              // Clear data in your specific Hive box
              await Hive.deleteBoxFromDisk('employee_db');

              // Navigate to the login screen
              // ignore: use_build_context_synchronously
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const Loginscreen()),
              );
            },
          ),
        ],
      );
    },
  );
}
