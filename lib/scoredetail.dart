import 'dart:ui';

import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:login/home.dart';
import 'package:login/quizstarthm.dart';
//import 'package:login/sign_in.dart';
import 'package:login/auth.dart';
import 'package:login/splash.dart';
//import 'package:login/authenticate.dart';
//import 'package:login/splash.dart';

class scoredetail extends StatefulWidget {

  String QA;
  scoredetail({Key key,@required this.QA}):super(key:key);
  @override
  _scoredetailState createState() => _scoredetailState(QA);
}
class _scoredetailState extends State<scoredetail> {
  //final AuthService _auth = AuthService();
  String QA;
  _scoredetailState(this.QA);

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
            "Details Q&A",
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
                          "Congrats - Details Q&A $QA",
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
          ],
        )
    );
  }
}
