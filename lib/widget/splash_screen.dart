import 'package:app/main.dart';
import 'package:app/screens/login_page.dart';
import 'package:app/widget/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Splashscreen> {
  @override
  void initState() {
    CheckUserLoggedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 200,
            ),
            Lottie.asset('assets/images/fvdvd.json'),
          ],
        ),
      ),
    );
  }

  Future<void> gotoLoginpage() async {
    await Future.delayed(const Duration(seconds: 5));
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const Loginscreen()),
    );
  }

  // ignore: non_constant_identifier_names
  Future<void> CheckUserLoggedIn() async {
    final sharedprefs = await SharedPreferences.getInstance();
    final userLoggedIn = sharedprefs.getBool(SAVE_KEY_NAME);
    if (userLoggedIn == null || userLoggedIn == false) {
      gotoLoginpage();
    } else {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (ctx1) => const BottomBar1(
          updatedImage: "",
          companyname: "welcome back ",
        ),
      ));
    }
  }
}
