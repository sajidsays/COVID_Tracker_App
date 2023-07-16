import 'dart:async';

import 'package:covidapp/views/world_states.dart';
import "package:flutter/material.dart";
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 10), vsync: this)
        ..repeat();
  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(const Duration(seconds: 5), () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const WorldStatesScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedBuilder(
              animation: _controller,
              child: const SizedBox(
                height: 200,
                width: 200,
                child: Center(
                  child: Image(
                      fit: BoxFit.cover, image: AssetImage('images/virus.png')),
                ),
              ),
              builder: (BuildContext context, Widget? child) {
                return Transform.rotate(
                    angle: _controller.value * 2.0 * math.pi, child: child);
              }),
          SizedBox(
            height: MediaQuery.of(context).size.height * .08,
          ),
          const Align(
              alignment: Alignment.center,
              child: Text(
                'COVID Tracker\nApplication',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 1, 63, 114),
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              )),
          SizedBox(
            height: MediaQuery.of(context).size.height * .09,
          ),
          const Align(
              alignment: Alignment.center,
              child: Text(
                'Powered by\nSajid Khan Afridi',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 84, 174, 248),
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                ),
              )),
        ],
      )),
    );
  }
}
