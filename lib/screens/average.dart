import 'package:flutter/material.dart';

class Average_screen extends StatelessWidget {
  const Average_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.grey.shade900,
            title: Text("Average Employees"),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.all(15),
            child: Container(
              height: 670,
              width: 380,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.grey.shade700,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      list(id: "B00001"),
                      SizedBox(
                        height: 10,
                      ),
                      list(id: "B00002"),
                      SizedBox(
                        height: 10,
                      ),
                      list(id: "B00003"),
                      SizedBox(
                        height: 10,
                      ),
                      list(id: "B00004"),
                      SizedBox(
                        height: 10,
                      ),
                      list(id: "B00005"),
                      SizedBox(
                        height: 10,
                      ),
                      list(id: "B00006"),
                      SizedBox(
                        height: 10,
                      ),
                      list(id: "B00007"),
                      SizedBox(
                        height: 10,
                      ),
                      list(id: "B00008"),
                      SizedBox(
                        height: 10,
                      ),
                      list(id: "B00009"),
                      SizedBox(
                        height: 10,
                      ),
                      list(id: "B000010"),
                      SizedBox(
                        height: 10,
                      ),
                      list(id: "B000011"),
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
        color: Colors.grey.shade200,
      ),
      child: Text(
        id,
      ),
    );
  }
}
