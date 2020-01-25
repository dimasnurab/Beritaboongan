import 'package:flutter/material.dart';
import 'package:sailor/sailor.dart';
import '../main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 1500), () {
      Routes.sailor.navigate(
        'beritapage',
        navigationType: NavigationType.pushAndRemoveUntil,
        removeUntilPredicate: (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        'BeritaBoboongan',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.teal,
        ),
      )),
    );
  }
}
