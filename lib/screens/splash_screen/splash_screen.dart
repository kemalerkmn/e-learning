import 'dart:async';

import 'package:flutter/material.dart';

import '../../companete/indicator.dart';
import '../intro_screen/intro_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Intro()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Indicator());
  }
}
