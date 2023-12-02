import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  final String companyname;

  const AboutScreen({super.key, required this.companyname});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
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
              "About",
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
            backgroundColor: Colors.cyan[400],
          ),
          body: const SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "App Description:",
                style: TextStyle(color: Colors.red, fontSize: 17),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                  "Welcome to our Employee Performance Management App, designed to streamline and enhance the way your company manages employee details and assesses performance. "),
              Text(
                "key features",
                style: TextStyle(color: Colors.red, fontSize: 17),
              ),
              Text(
                "> Employee Details",
                style: TextStyle(color: Colors.blue),
              ),
              Text(
                  "Store essential employee information, including name, gender, category, email, percentage, and an image for quick identification."),
              Text(
                "> Performance Categorization",
                style: TextStyle(color: Colors.blue),
              ),
              Text(
                  "Automatically categorize employee performance into three levels: Best,Average, and Low based on predefined criteria or performance metrics."),
              Text(
                "> Percentage Calculation:",
                style: TextStyle(color: Colors.blue),
              ),
              Text(
                  "Tailor the performance categories to align with your company's unique evaluation criteria. Beyond Best ,Average, and Low,."),
              SizedBox(
                height: 5,
              ),
              Text(
                "> Search and Edit:",
                style: TextStyle(color: Colors.blue),
              ),
              Text(
                "> Interactive User Interface:",
                style: TextStyle(color: Colors.blue),
              ),
              Text(
                "> Detail and Edit Pages:",
                style: TextStyle(color: Colors.blue),
              ),
              Text(
                ">Employee Deletion:",
                style: TextStyle(color: Colors.blue),
              ),
              Text(
                "Chart Visualization:",
                style: TextStyle(color: Colors.blue),
              ),
              Text(
                "> Visual Feedback:",
                style: TextStyle(color: Colors.blue),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Contact Us",
                style: TextStyle(color: Colors.red, fontSize: 17),
              ),
              Text(
                "Email  :",
                style: TextStyle(color: Colors.blue),
              ),
              Text("Farisvt768@gmail.com"),
            ]),
          )),
    );
  }
}
