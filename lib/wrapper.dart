import 'package:flutter/material.dart';
import 'package:login/authenticate.dart';
import 'package:login/loginScreen .dart';
import 'package:provider/provider.dart';
import 'package:login/user.dart';

    class Wrapper extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        final user = Provider.of<User>(context);
        //print(user);

        // Return either home or Authenticate User
        if (user == null) {
          return Authenticate();
        } else {
          return LoginScreen();
        }
      }
    }
