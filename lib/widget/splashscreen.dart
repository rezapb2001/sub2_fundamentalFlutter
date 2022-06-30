import 'package:flutter/material.dart';
import 'dart:async';
import '../ui/login.dart';

class Splashscreenpage extends StatefulWidget {
  static const routeName = '/splashscreen';

  @override
  State<Splashscreenpage> createState() => _SplashscreenpageState();
}

class _SplashscreenpageState extends State<Splashscreenpage> {
  @override
  void initState() {
    super.initState();
    startSpalshScreen();
  }

  startSpalshScreen() async {
    var durasi = const Duration(seconds: 5);
    return Timer(durasi, () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return Login();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const Center(
          child: Text('.oO0  RESTAURANT  0Oo.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Color(0xffffffff)
            ),
          ),
        ),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[Colors.green, Colors.blue],
          ),
        ),
      ),
    );
  }
}
