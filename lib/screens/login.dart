// ignore_for_file: use_build_context_synchronously, sort_child_properties_last

import 'package:app/main.dart';
import 'package:app/widget/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({Key? key}) : super(key: key);

  @override
  State<Loginscreen> createState() => _LoginState();
}

class _LoginState extends State<Loginscreen> {
  final _usernameController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _page(),
    );
  }

  Widget _page() {
    return Form(
      key: _formkey,
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _inputField(
                "username",
                _usernameController,
                isUsername: true,
              ),
              const SizedBox(height: 20),
              _loginButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _inputField(String hintText, TextEditingController controller,
      {bool isUsername = false}) {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: const BorderSide(color: Colors.black),
    );

    return TextFormField(
      style: const TextStyle(color: Colors.blue),
      controller: _usernameController,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.blue),
        enabledBorder: border,
        focusedBorder: border,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'No Username found';
        } else {
          return null;
        }
      },
      obscureText: isUsername,
    );
  }

  Widget _loginButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formkey.currentState!.validate()) {
          checkLogin(context);
        } else {
          print('empty value');
        }
      },
      child: const SizedBox(
        width: double.infinity,
        child: Text(
          "Sign in",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      ),
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
    );
  }

  void checkLogin(BuildContext ctx) async {
    final username = _usernameController.text;
    final sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.setBool(SAVE_KEY_NAME, true);
    await sharedPrefs.setString('username', username);

    Navigator.pushReplacement(
      ctx,
      MaterialPageRoute(
        builder: (ctx1) => BottomBar1(
          companyname: username,
          updatedImage: "",
        ),
      ),
    );
  }
}
