import 'package:flutter/material.dart';
import 'package:login/authenticate.dart';
import 'package:login/home.dart';
import 'package:provider/provider.dart';
import 'package:login/user.dart';
//import 'package:login/auth.dart';
//import 'package:login/constants.dart';
//import 'package:login/loading.dart';
//import 'package:login/register.dart';
//import 'dart:async';
//import 'dart:convert';

    class Wrapper extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        final user = Provider.of<User>(context);
        //print(user);

        // Return either home or Authenticate User
        if (user == null) {
          return Authenticate();
        } else {
          return Home();
        }
      }
    }
