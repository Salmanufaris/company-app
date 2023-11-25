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
          backgroundColor: Colors.orange[200],
        ),
        body: const Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              "1. Data Usage and Security:",
              style: TextStyle(color: Colors.red, fontSize: 17),
            ),
            Text(
                ".The App stores employee data categorically, using labels such as Best, Average, and Low."),
            Text(
                ".User data is encrypted and stored securely to ensure confidentiality."),
            SizedBox(
              height: 10,
            ),
            Text(
              "2 .User Responsibilities:",
              style: TextStyle(color: Colors.red, fontSize: 17),
            ),
            Text(
                ".Users are responsible for the accuracy and relevance of the data entered into the App"),
            SizedBox(
              height: 10,
            ),
            Text(
              "3. Filtering Feature:",
              style: TextStyle(color: Colors.red, fontSize: 17),
            ),
            Text("The App includes a filtering feature on in  screens."),
            SizedBox(
              height: 10,
            ),
            Text(
              "7. Termination of Usage:",
              style: TextStyle(color: Colors.red, fontSize: 17),
            ),
            Text(
                "The company reserves the right to terminate user access to the App in case of misuse or violation of terms."),
            SizedBox(
              height: 10,
            ),
            Text(
              "8. Feedback and Support:",
              style: TextStyle(color: Colors.red, fontSize: 17),
            ),
            Text(
                "Users are welcome to provide feedback for continuous improvement. Contact support at farisvt768@gmail.com.")
          ],
        ),
      ),
    );
  }
}
