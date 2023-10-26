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
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade800,
          leading: Icon(
            Icons.search,
            color: Colors.white,
          ),
          actions: [
            InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Settings_Screen()));
                },
                child: Icon(
                  Icons.settings,
                  color: Colors.white,
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 220,
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: CircleAvatar(
                        backgroundColor: Colors.grey.shade300,
                        radius: 80,
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      height: 16,
                      width: 100,
                      color: Colors.white,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Add_Screen()));
                        },
                        child: Container(
                          alignment: Alignment.topLeft,
                          height: 20,
                          width: 20,
                          color: Colors.black,
                          child: Icon(
                            Icons.add,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 30,
                      width: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.grey.shade300,
                      ),
                      child: Text("Company name"),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 500,
                width: 390,
                color: Colors.grey.shade100,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      list(id: "A00001"),
                      SizedBox(
                        height: 10,
                      ),
                      list(id: "A00002"),
                      SizedBox(
                        height: 10,
                      ),
                      list(id: "A00001"),
                      SizedBox(
                        height: 10,
                      ),
                      list(id: "A00002"),
                      SizedBox(
                        height: 10,
                      ),
                      list(id: "A00001"),
                      SizedBox(
                        height: 10,
                      ),
                      list(id: "A00002"),
                      SizedBox(
                        height: 10,
                      ),
                      list(id: "A00002"),
                      list(id: "A00001"),
                      SizedBox(
                        height: 10,
                      ),
                      list(id: "A00002"),
                      SizedBox(
                        height: 10,
                      ),
                      list(id: "A00001"),
                      SizedBox(
                        height: 10,
                      ),
                      list(id: "A00002"),
                      SizedBox(
                        height: 10,
                      ),
                      list(id: "A00001"),
                      SizedBox(
                        height: 10,
                      ),
                      list(id: "A00002"),
                      SizedBox(
                        height: 10,
                      ),
                      list(id: "A00002"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container list({required String id}) {
    return Container(
      height: 60,
      width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey.shade400,
      ),
      child: Row(
        children: [
          SizedBox(
            width: 5,
          ),
          Text(id),
          SizedBox(
            width: 200,
          ),
          Icon(
            Icons.edit,
            color: Colors.black,
          ),
          SizedBox(
            width: 4,
          ),
          Icon(
            Icons.delete,
            color: Colors.red,
          ),
          SizedBox(
            width: 4,
          ),
          Icon(Icons.expand_more)
        ],
      ),
    );
  }
}
