import 'package:app/screens/home.dart';
import 'package:app/screens/subscreens/onbody1.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Container(
        height: double.infinity,
        color: Colors.grey.shade300,
        width: double.infinity,
        alignment: Alignment.center,
        child: Container(
          height: 600,
          width: 350,
          color: Colors.grey.shade300,
          child: Column(
            children: [
              SizedBox(
                height: 120,
              ),
              CircleAvatar(
                radius: 70,
                backgroundColor: Colors.white,
                child: InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: AlertDialog(
                              title: Text(
                                "Which one you want?",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.brown),
                              ),
                              actions: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.camera_alt_outlined),
                                ),
                                IconButton(
                                    onPressed: () {}, icon: Icon(Icons.image))
                              ],
                              actionsAlignment: MainAxisAlignment.center,
                            ),
                          );
                        });
                  },
                  child: Icon(
                    Icons.add,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Company name",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Screen1()));
                },
                child: Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.green,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Lets go",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
