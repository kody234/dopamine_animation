import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
  static String id = 'splash_screen';
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late AnimationController controller1;
  late AnimationController controller2;
  late Animation animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    controller.addListener(() {
      setState(() {});
    });
    controller1 =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    controller1.addListener(() {
      setState(() {});
      print(controller2.value);
    });
    controller2 =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    controller2.addListener(() {
      setState(() {});
    });

    animation =
        AlignmentTween(begin: Alignment.center, end: Alignment.centerLeft)
            .animate(controller);

    Timer(const Duration(seconds: 1), () {
      controller.forward();
    });

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller1.forward();
      }
    });
    controller1.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller2.forward();
      }
    });

    controller2.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller2.reverse();
      }
      if (status == AnimationStatus.dismissed) {
        controller2.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff15181b),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Opacity(
                opacity: 1 - controller2.value,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Opacity(
                      opacity: controller1.value,
                      child: Text(
                        'D',
                        style: TextStyle(
                            fontSize: 50 * controller.value,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ),
                    ),
                    Align(
                      alignment: animation.value,
                      child: Image.asset(
                        'assets/smiley.png',
                        height: 280 - (controller.value * 235),
                        width: 280 - (controller.value * 235),
                      ),
                    ),
                    Opacity(
                      opacity: controller1.value,
                      child: Text(
                        'P',
                        style: TextStyle(
                            fontSize: 50 * controller.value,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ),
                    ),
                    Opacity(
                      opacity: controller1.value,
                      child: Text(
                        'A',
                        style: TextStyle(
                            fontSize: 50 * controller.value,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ),
                    ),
                    Opacity(
                      opacity: controller1.value,
                      child: Text(
                        'M',
                        style: TextStyle(
                            fontSize: 50 * controller.value,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ),
                    ),
                    Opacity(
                      opacity: controller1.value,
                      child: Text(
                        'I',
                        style: TextStyle(
                            fontSize: 50 * controller.value,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ),
                    ),
                    Opacity(
                      opacity: controller1.value,
                      child: Text(
                        'N',
                        style: TextStyle(
                            fontSize: 50 * controller.value,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ),
                    ),
                    Opacity(
                      opacity: controller1.value,
                      child: Text(
                        'E',
                        style: TextStyle(
                            fontSize: 50 * controller.value,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'loading',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ),
                  Text(
                    '${(controller.value * 100).toInt()}% ',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
