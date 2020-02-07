import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login/quizstarthm.dart';

class resultpage extends StatefulWidget {
  int marks;
  resultpage({Key key,@required this.marks}):super(key:key);
  @override
  _resultpageState createState() => _resultpageState(marks);
}

class _resultpageState extends State<resultpage> {
  int marks;
  _resultpageState(this.marks);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
            title:Text(
              "Result",
            )
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
                          height: 300.0,
                          child:ClipRect(
                            child:Image(
                              image:AssetImage(
                                "images/flutter.png",
                              ),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child:Text(
                          "Congratulations you \nScored $marks  marks!",
                          style:TextStyle(
                            fontSize: 25.0,
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
                        builder:(context)=> quizstarthm(),
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
