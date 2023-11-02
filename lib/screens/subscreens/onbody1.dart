import 'package:app/screens/home.dart';
import 'package:app/screens/subscreens/intro1.dart';
import 'package:app/screens/subscreens/intro2.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue.shade900,
        body: Stack(
          children: [
            PageView(
              controller: _controller,
              children: [IntroScree1(), IntroScreen2()],
            ),
            Container(
                alignment: Alignment(0, 0.75),
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: ((context) => Screen1())));
                    },
                    child: Container(
                        child: SmoothPageIndicator(
                            controller: _controller, count: 2)))),
          ],
        ));
  }
}
