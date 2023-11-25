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
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                )),
            title: const Text(
              "About",
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
            backgroundColor: Colors.orange[200],
          ),
          body: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: 10,
              ),
              Text(
                "Company App",
                style: TextStyle(color: Colors.red, fontSize: 17),
              ),
              SizedBox(
                height: 5,
              ),
              Text("version 1.00"),
              SizedBox(
                height: 10,
              ),
              Text(
                "Description",
                style: TextStyle(color: Colors.red, fontSize: 17),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                  "TeamInsight is your all-in-one solution for seamless employee data management. Categorize performance effortlessly into Best, Average , and Low to gain quick insights. Customize categories, set goals, and track progress with ease"),
              Text(
                "key features",
                style: TextStyle(color: Colors.red, fontSize: 17),
              ),
              Text(
                "> Employee data management",
                style: TextStyle(color: Colors.blue),
              ),
              Text(
                  "Efficiently store and organize your employee data in a secure and user-friendly platform"),
              Text(
                "> Performance Metrics at a Glance",
                style: TextStyle(color: Colors.blue),
              ),
              Text(
                  "TeamInsight provides a visual representation of employee performance through easy-to-read charts and graphs"),
              Text(
                "> Customized Performance Categories",
                style: TextStyle(color: Colors.blue),
              ),
              Text(
                  "Tailor the performance categories to align with your company's unique evaluation criteria. Beyond Best ,Average, and Low,."),
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
