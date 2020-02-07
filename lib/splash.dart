import 'dart:async';
import 'package:flutter/material.dart';
import 'package:login/quizstarthm.dart';
import 'package:flutter/services.dart';


class splashscreen extends StatefulWidget {
  @override
  _splashscreenState createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3),()
    {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => quizstarthm(),
      ));
    });
  }

  @override
  // void initstate()
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body:Center(
            child:Text(
              "QuizStar",
              style: TextStyle(
                fontSize: 50.0,
                color: Colors.white,
                fontFamily: "Satisfy",
              ),
            )
        )
    );
  }
}

