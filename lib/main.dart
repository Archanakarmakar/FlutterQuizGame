//import 'dart:async';
//import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:login/auth.dart';
import 'package:login/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:login/user.dart';
//import 'package:login/sign_in.dart';
//import 'package:login/home.dart';
//import 'package:login/splash.dart';
//import 'package:color/color.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
          home: Wrapper(),

    /*debugShowCheckedModeBanner: false,
        title: 'Quizstar',
        theme: ThemeData(
          primarySwatch:Colors.black,
           ),
          home:Wrapper(),
         */
      ),
      );
  }
}

