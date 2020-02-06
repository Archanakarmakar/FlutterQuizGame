import 'package:flutter/material.dart';
import 'package:login/auth.dart';
import 'package:login/authenticate.dart';
import 'package:login/auth.dart';

class  Home extends StatelessWidget {
  final AuthService _auth= AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.white,
      appBar: AppBar(
        title:Text('Select Options for Kids Quiz'),
        backgroundColor: Colors.green[900],
        elevation: 0.0,
              actions:<Widget>[
          FlatButton.icon(
            icon:Icon(Icons.person),
            label:Text('logout'),
            color: Colors.red,
            onPressed: ()async{
              await _auth.signOut();
            },
          ),

        ],

      ),
      
      body: Center(
        child: FlatButton(
            onPressed: (){
              },
          child: Text("START"),
          color: Colors.amberAccent,
            ),
      ),
    );
  }
}
