//import 'dart:async';
//import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login/home.dart';
import 'package:login/quizpage.dart';
import 'package:login/auth.dart';
//import 'package:login/authenticate.dart';

class quizstarthm extends StatefulWidget {
 // final AuthService _auth= AuthService();

  @override
  _quizstarthmState createState() => _quizstarthmState();
}

class _quizstarthmState extends State<quizstarthm> {

  final AuthService _auth = AuthService();

  List<String> images = [
    "images/quizimg.png",
    "images/img.png",

  ];
  Widget customcard(String langname,String image){
    return Padding(
        padding:EdgeInsets.all(
          20.0,
        ),
        child: InkWell(
          onTap:(){
            //debugPrint('Card Tapped');
              Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder:(context) => getjson(),
            ));
          },

          child: Material(
            color:Colors.blue,
            elevation: 10.0,
            borderRadius: BorderRadius.circular(20.0),
            child:Container(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical:10.0,
                    ),
                    child:Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(100.0),
                      child: Container(
                        height:200.0,
                        width: 200.0,
                        child: ClipOval(
                          child:Image(
                            fit: BoxFit.cover,
                            image:AssetImage(
                              image,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child:Text(
                      langname,
                      style:TextStyle(
                        fontSize: 24.0,
                        color:Colors.white,
                        //fontFamily: "Alike" ,
                        //fontWeight:FontWeight.w700,
                      ),
                    ),
                  ),

                ],
              ),

            ),
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,DeviceOrientation.portraitUp

    ]);
    return Scaffold(
        appBar: AppBar(
          title: Text("Start Kids Quiz"),
          backgroundColor:Colors.indigo,
          elevation: 0.0,
          actions:<Widget>[
            FlutterLogo(size:60),
            FlatButton.icon(
              icon:Icon(Icons.home),
              label:Text('Go Home'),
              color:Colors.red[500],
              onPressed: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder:(context)=> Home(),
                ));
              },
            ),
          ],

        ),

        body:ListView(
          children: <Widget>[
            customcard("1st Grade Math",images[0]),
            customcard("1st Grade GK",images[1]),
          ],
        )
    );
  }
}
