// ignore_for_file: unused_local_variable
import 'package:hive/hive.dart';
import 'package:app/view/loginscreen/login_page.dart';
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
          "This will logout the App. Your data will clear. Do you want to continue?",
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
              await Hive.close();
              await Hive.deleteBoxFromDisk('employee_db');

              // ignore: use_build_context_synchronously
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (ctx) => const Loginscreen()),
                  (route) => false);
            },
          ),
        ],
      );
    },
  );
}
