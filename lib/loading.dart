import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/services.dart';

class  Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
            color: Colors.white,
            child: Center(
            child: SpinKitChasingDots(
            color: Colors.brown,
             size: 50.0,
          ),
          )
        );
          }
        }
