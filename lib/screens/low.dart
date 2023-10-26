import 'package:flutter/material.dart';

class Low_screen extends StatelessWidget {
  const Low_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey.shade900,
            title: Text("Low Employees"),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.all(15),
            child: Container(
              height: 700,
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
                      list(id: "C00001"),
                      SizedBox(
                        height: 10,
                      ),
                      list(id: "C00002"),
                      SizedBox(
                        height: 10,
                      ),
                      list(id: "C00003"),
                      SizedBox(
                        height: 10,
                      ),
                      list(id: "C00004"),
                      SizedBox(
                        height: 10,
                      ),
                      list(id: "C00005"),
                      SizedBox(
                        height: 10,
                      ),
                      list(id: "C00006"),
                      SizedBox(
                        height: 10,
                      ),
                      list(id: "C00007"),
                      SizedBox(
                        height: 10,
                      ),
                      list(id: "C00008"),
                      SizedBox(
                        height: 10,
                      ),
                      list(id: "C00009"),
                      SizedBox(
                        height: 10,
                      ),
                      list(id: "C000010"),
                      SizedBox(
                        height: 10,
                      ),
                      list(id: "C000011"),
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
