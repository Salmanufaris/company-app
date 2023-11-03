import 'package:app/Model/data_model.dart';
import 'package:app/widget/bottombar.dart';
import 'package:app/screens/home.dart';
import 'package:flutter/material.dart';

class IntroScreen2 extends StatelessWidget {
  const IntroScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      body: Center(
        child: Container(
          height: 650,
          width: 400,
          color: Colors.indigo[900],
          child: Column(
            children: [
              Container(
                height: 400,
                width: 400,
                color: Colors.indigo[900],
                child: Column(
                  children: [
                    SizedBox(
                      height: 300,
                    ),
                    Text(
                      "INCREASE YOUR SKILL",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "AND PERFOMANCE",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    )
                  ],
                ),
              ),
              Container(
                height: 250,
                width: 400,
                color: Colors.indigo[900],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 50,
                      width: 390,
                      color: Colors.indigo[900],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => BottomBar1(
                                        // employee: EmployeeModel(
                                        //     id: '',
                                        //     name: '',
                                        //     gender: "",
                                        //     adress: "",
                                        //     email: "",
                                        //     phone: "")
                                        )));
                              },
                              child: Text(
                                "Next Page",
                                style: TextStyle(color: Colors.yellow),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
