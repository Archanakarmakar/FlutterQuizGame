import 'dart:ui';

import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:login/home.dart';
import 'package:login/quizstarthm.dart';
//import 'package:login/sign_in.dart';
import 'package:login/auth.dart';
import 'package:login/scoredetail.dart';
import 'package:login/splash.dart';
//import 'package:login/authenticate.dart';
//import 'package:login/splash.dart';

class resultpage extends StatefulWidget {

  int marks;
  String QA;

  resultpage({Key key,@required this.marks}):super(key:key);

  @override
  _resultpageState createState() => _resultpageState(marks);
 }
class _resultpageState extends State<resultpage> {
  //final AuthService _auth = AuthService();
  int marks;
  _resultpageState(this.marks);


  @override

  // Timer Setting in Result Page
  /*void initState(){
    super.initState();
    Timer(Duration(seconds: 20),()
    {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => splashscreen(),
      ));
    });
  }*/

  Widget build(BuildContext context) {
    return  Scaffold(
           appBar: AppBar(
            title:Text(
              "Result",
            ),
          backgroundColor:Colors.lightGreen,
            actions:<Widget>[
              FlutterLogo(size:60),
             FlatButton.icon(
               icon:Icon(Icons.person),
               label:Text('Go Home'),
               color:Colors.red[500],
               onPressed:(){

                   Navigator.of(context).pushReplacement(MaterialPageRoute(
                   builder:(context)=> Home(),
                 ));
              },
             ),
           ],
          ),
        body:Column(
          children: <Widget>[
            Expanded(
              flex:7,
              child:Material(
                elevation: 20.0 ,
                child:Container(
                  child:Column(
                    children: <Widget>[
                      Material(
                        child:Container(
                          width:300.0,
                          height: 200.0,
                          child:ClipRect(
                            child:Image(
                              image:AssetImage(
                                "images/congo.jpg",
                              ),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child:Text(
                          "Congrats - Your Scored $marks !!",
                            style:TextStyle(
                            fontSize: 13.0,
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
              flex:1,
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
                      "Restart Quiz",
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
            Expanded(
              flex:1,
              child:Row(
                mainAxisAlignment:MainAxisAlignment.spaceAround,
                children: <Widget>[
                  OutlineButton(
                    onPressed:(){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder:(context)=> scoredetail(),
                      ));
                    },
                    child:Text(
                      "Details Score",
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
        )
    );
  }
}
