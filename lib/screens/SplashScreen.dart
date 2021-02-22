import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ChooseSignInOrSignUp.dart';
import '../utils/Colors.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  ///Variable
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacementNamed(ChooseSignInOrSignUp.id);
    });
  }

  ////////////Screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(),
        CupertinoActivityIndicator(),
        Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Text(
            "B-commerce.",
            style: TextStyle(
                fontSize: 28.0,
                color: black,
                letterSpacing: 2,
                fontFamily: "Pacifico"),
          ),
        ),
      ],
    ));
  }
}
