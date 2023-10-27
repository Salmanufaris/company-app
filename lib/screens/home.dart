import 'package:app/screens/add.dart';
import 'package:app/screens/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey.shade500,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        leading: Icon(
          Icons.search,
          color: Colors.white,
        ),
        actions: [
          InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Settings_Screen()));
              },
              child: Icon(
                Icons.settings,
                color: Colors.white,
              ))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            CircleAvatar(
              radius: 80,
              backgroundColor: Colors.grey.shade300,
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Add_Screen()));
                },
                child: Text(
                  "Add",
                  style: TextStyle(color: Colors.amber),
                )),
            Container(
              alignment: Alignment.center,
              height: 30,
              width: 140,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey.shade400),
              child: Text(
                "Company name",
              ),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    ));
  }
}
