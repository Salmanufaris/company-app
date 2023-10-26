import 'package:flutter/material.dart';

class Best_screen extends StatelessWidget {
  const Best_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey.shade800,
            title: Text("Best Employees"),
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
        color: Colors.grey.shade200,
      ),
      child: Text(
        id,
      ),
    );
  }
}
