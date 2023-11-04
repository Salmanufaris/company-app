import 'package:flutter/material.dart';

class Bestscreen extends StatelessWidget {
  const Bestscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.teal[500],
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.teal[300],
            title: Text(
              "Best Employees",
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.all(15),
            child: Container(
              height: 670,
              width: 380,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.teal[600],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      list(id: "A00001"),
                      SizedBox(
                        height: 10,
                      ),
                      list(id: "A00002"),
                      SizedBox(
                        height: 10,
                      ),
                      list(id: "A00003"),
                      SizedBox(
                        height: 10,
                      ),
                      list(id: "A00004"),
                      SizedBox(
                        height: 10,
                      ),
                      list(id: "A00005"),
                      SizedBox(
                        height: 10,
                      ),
                      list(id: "A00006"),
                      SizedBox(
                        height: 10,
                      ),
                      list(id: "A00007"),
                      SizedBox(
                        height: 10,
                      ),
                      list(id: "A00008"),
                      SizedBox(
                        height: 10,
                      ),
                      list(id: "A00009"),
                      SizedBox(
                        height: 10,
                      ),
                      list(id: "A000010"),
                      SizedBox(
                        height: 10,
                      ),
                      list(id: "A000011"),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }

  Container list({required String id}) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(5),
      height: 60,
      width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: Colors.teal[100],
      ),
      child: Text(
        id,
      ),
    );
  }
}
