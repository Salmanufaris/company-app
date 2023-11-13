import 'package:app/screens/home.dart';
import 'package:app/widget/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.teal[500],
            body: Center(
              child: Container(
                color: Colors.teal,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "field is empty";
                            }
                          },
                          decoration: InputDecoration(
                              hintText: "Company name",
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(
                                r'[a-z]')), // Allow only numeric characters
                          ],
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "field is empty";
                            }
                          },
                          decoration: InputDecoration(
                              hintText: "Password",
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          maxLength: 8,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(
                                r'[0-9]')), // Allow only numeric characters
                          ],
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      MaterialButton(
                          color: Colors.black,
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: ((context) => BottomBar1())));
                            }
                          })
                    ],
                  ),
                ),
              ),
            )));
  }
}
