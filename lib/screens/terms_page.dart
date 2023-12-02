import 'package:flutter/material.dart';

class TermsScreen extends StatelessWidget {
  final String companyname;
  const TermsScreen({super.key, required this.companyname});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          title: const Text(
            "Terms&Conditions",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.cyan[400],
        ),
        body: const Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              "1.Acceptance of Terms:",
              style: TextStyle(color: Colors.red, fontSize: 17),
            ),
            Text(
                ".By using the Employee Performance Management App, you agree to be bound by these terms and conditions. If you do not agree, please refrain from using the App."),
            SizedBox(
              height: 10,
            ),
            Text(
              "2 .User Responsibilities:",
              style: TextStyle(color: Colors.red, fontSize: 17),
            ),
            Text(
                ".Users are responsible for maintaining the confidentiality of their account credentials. Do not share your account information with others."),
            SizedBox(
              height: 10,
            ),
            Text(
              "3.  Data Accuracy:",
              style: TextStyle(color: Colors.red, fontSize: 17),
            ),
            Text(
                "Users are responsible for providing accurate information when adding or updating employee details. The App owner is not liable for any inaccuracies resulting from user-provided data."),
            SizedBox(
              height: 10,
            ),
            Text(
              "7.  Privacy and Security:",
              style: TextStyle(color: Colors.red, fontSize: 17),
            ),
            Text(
                "TThe App prioritizes user privacy and employs reasonable security measures. Review the Privacy Policy for detailed information."),
            SizedBox(
              height: 10,
            ),
            Text(
              "8. Intellectual Property:",
              style: TextStyle(color: Colors.red, fontSize: 17),
            ),
            Text(
                "All content within the App is the property of the App owner and is protected by intellectual property laws."),
            Text(
              "8. Limitation of Liability:",
              style: TextStyle(color: Colors.red, fontSize: 17),
            ),
            Text(
                "AThe App owner is not liable for any damages arising from the use of the App. Use the App at your own risk."),
            Text(
              "8.Changes to Terms:",
              style: TextStyle(color: Colors.red, fontSize: 17),
            ),
            Text(
                "The App owner reserves the right to update these terms and conditions. Users will be notified of significant changes.")
          ],
        ),
      ),
    );
  }
}
