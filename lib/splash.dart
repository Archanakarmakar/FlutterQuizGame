import 'dart:async';
//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:login/quizstarthm.dart';
//import 'package:flutter/services.dart';
import 'package:login/home.dart';

class splashscreen extends StatefulWidget {
  @override
  _splashscreenState createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 10),()
    {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => quizstarthm(),
      ));
    });
  }

  @override
  // void initstate()
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
         title:Text(
                 "About",
                  ),
              backgroundColor:Colors.indigo,
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
              mainAxisAlignment:MainAxisAlignment.center,
             children: <Widget>[
               Expanded(
                flex:1,
                child:Material(
                elevation: 40.0 ,
                  child:Container(
                    child:Text(
                            "Quiz Start:",
                             style: TextStyle(
                             fontSize: 50.0,
                             color: Colors.indigo,
                             fontFamily: "Satisfy",
                                 ),
                                ),
                                  ),
                                ),
            ),
                         Expanded(
                           flex:5,
                           child:Material(
                                 child:Text(
                                   "Rules:",
                                   style: TextStyle(
                                     fontSize: 40.0,
                                     color: Colors.indigo,
                                     fontFamily: "Satisfy",
                                   ),
                                 )
                               )
                     ) ,
                              ],



            ),



    );
  }
}

