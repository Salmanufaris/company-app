// ignore_for_file: avoid_print

import 'package:app/controller/Login_provider.dart';
import 'package:app/main.dart';
import 'package:app/widget/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _page(context),
    );
  }

  Widget _page(BuildContext context) {
    final pro = Provider.of<LoginProvider>(context, listen: false);
    return Form(
      key: pro.formkey,
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _inputField(
                "company name",
                pro.usernameController,
                isUsername: true,
                context: context,
              ),
              const SizedBox(height: 20),
              _loginButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _inputField(String hintText, TextEditingController controller,
      {bool isUsername = false, required BuildContext context}) {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: const BorderSide(color: Colors.cyan),
    );

    return TextFormField(
      style: const TextStyle(color: Colors.blue),
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.blue),
        enabledBorder: border,
        focusedBorder: border,
      ),
      validator: (value) {
        if (isUsername && (value == null || value.isEmpty)) {
          return 'No Username found';
        } else {
          return null;
        }
      },
    );
  }

  Widget _loginButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (Provider.of<LoginProvider>(context, listen: false)
            .formkey
            .currentState!
            .validate()) {
          checkLogin(context);
        } else {
          print('empty value');
        }
      },
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        backgroundColor: Colors.cyan,
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      child: const SizedBox(
        width: double.infinity,
        child: Text(
          "Sign in",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  void checkLogin(BuildContext ctx) async {
    final provid = Provider.of<LoginProvider>(ctx, listen: false);
    final username = provid.usernameController.text;
    final sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.setBool(SAVE_KEY_NAME, true);
    await sharedPrefs.setString('username', username);

    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
      ctx,
      MaterialPageRoute(
        builder: (ctx1) => BottomBar1(
          companyname: username,
        ),
      ),
    );
  }
}
