import 'package:flutter/material.dart';
import 'package:login/sign_in.dart';
import 'package:login/register.dart';

import 'package:login/auth.dart';
import 'package:login/authenticate.dart';
import 'package:login/auth.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;

  void toggleView () {
    setState(() => showSignIn = !showSignIn);

  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignIn(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
    }

  }
}

