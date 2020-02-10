//import 'dart:async';
//import 'dart:convert';
//import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:login/auth.dart';
//import 'package:login/authenticate.dart';
import 'package:login/splash.dart';
//import 'package:login/quizpage.dart';
//import 'package:color/color.dart';
//import 'package:login/register.dart';
//import 'package:login/splash.dart';


class  Home extends StatelessWidget {
  final AuthService _auth= AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor:Colors.lightGreenAccent,
      appBar: AppBar(
        title:Text(' Kids Quiz game'),
        backgroundColor:Colors.indigo,
        elevation: 0.0,
        actions:<Widget>[
          FlutterLogo(size:60),
          FlatButton.icon(
            icon:Icon(Icons.person),
            label:Text('LOGOUT'),
            color:Colors.red[500],
              onPressed: ()async{
              await _auth.signOut();
              print("Clicked on LOGOUT");
            },
          ),
        ],

      ),
      body:Column(
      children: <Widget>[
       Expanded(
       flex:5,
         child:Material(
         elevation: 20.0 ,
           child:Container(
            child:Column(
           children: <Widget>[
             Material(
              child:Container(
                 width:300.0,
                height: 300.0,
                child:ClipRect(
                   child:Image(
                 image:AssetImage(
                 "images/kq.png",
                              ),
                            ),
                          ),
                       ),
                      ),
             Center(
               child:Text(
                 "* Click on Continue to Start The Quiz!",
                 style:TextStyle(color: Colors.blue,
                   fontSize: 15.0,
                   fontFamily: "Quando",
                 ),
               ),
             ),
           ],
            ),
           ),

         ),
      ),
       Expanded(
        flex:4,
        child:Row(
          mainAxisAlignment:MainAxisAlignment.center,
          children: <Widget>[
            OutlineButton(
              onPressed:(){
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder:(context)=> splashscreen(),
                ));
              },
              child:Text(
                "Continue",
                style:TextStyle(
                  fontSize: 18.0,
                ),
              ),
              padding:EdgeInsets.symmetric(
                vertical:10.0,
                horizontal: 25.0,
              ),
              borderSide: BorderSide(width:5.0,color:Colors.indigo),
              splashColor: Colors.indigoAccent,
            )
          ],
        ),
      ),
      ],
      ),
    );
  }
}