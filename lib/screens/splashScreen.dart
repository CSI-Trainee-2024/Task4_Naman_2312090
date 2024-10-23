import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_app/main.dart';

class splashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => splashState();
}

class splashState extends State<splashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MyHomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xff09203f), Color(0xff537895)]),
        ),
        child: Center(
          child: Image.asset(
            "assets/splashNew.png",
            width: 220,
          ),
        ),
      ),
    );
  }
}
