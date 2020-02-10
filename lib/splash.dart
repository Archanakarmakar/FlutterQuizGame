import 'dart:async';
//import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/quizstarthm.dart';
//import 'package:flutter/services.dart';
import 'package:login/home.dart';

class splashscreen extends StatefulWidget {
  @override
  _splashscreenState createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  final _formKey = GlobalKey<FormState>();
   final List<String> _garads=[ "Grade1","Grade2","Grade3","Grade4","Grade5"];
  var _chooseItemSelected = "Grade1";
   @override
 /* void initState(){
    super.initState();
    Timer(Duration(seconds: 20),()
    {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => quizstarthm(),
      ));
    });
  }
*/
  @override
  // void initstate()
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
         title:Text(
                 "About Kids Quiz",
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
                elevation: 2.0 ,
                  child:Container(
                    child:Text(
                            "Kids Quiz:",
                             style: TextStyle(
                             fontSize: 40.0,
                             color: Colors.indigo,
                             fontFamily: "Satisfy",
                                 ),
                                ),
                                  ),
                                ),
            ),
                         Expanded(
                           flex:2,
                           child:Material(
                                 child:Text(
                                   "Select the Grades",
                                   style: TextStyle(
                                     fontSize: 25.0,
                                     color: Colors.indigo,
                                     fontFamily: "Quando",
                                   ),
                                 )
                               )

                     ) ,
               Expanded(
                   flex:4,
                 child: Form(
                   key: _formKey,
                   child:ListView(
                     padding:EdgeInsets.symmetric(horizontal:30.0),
                        children:<Widget>[
                         Row(
                           mainAxisAlignment:MainAxisAlignment.center,
                           children:<Widget>[
                            Icon(Icons.grade),
                             SizedBox(width:100.0,),
                             DropdownButton<String>(
                             items:_garads.map((String dropDownStringItem){
                               return DropdownMenuItem<String>(
                                 value:dropDownStringItem,
                                 child:Text(dropDownStringItem),
                               );



                             }).toList(),
                               onChanged:(String newValue) {
                                 setState(() {
                                 this. _chooseItemSelected = newValue;
                                 });
                               },
                               value: _chooseItemSelected,

                             ),
                             FlatButton.icon(
                               icon:Icon(Icons.subject),
                               label:Text('Play'),
                               color:Colors.red[500],
                               onPressed:(){

                                 Navigator.of(context).pushReplacement(MaterialPageRoute(
                                   builder:(context)=> quizstarthm(),
                                 ));
                               },
                             ),
                           ],
                         ),
                         ],


                          ),
                 ),
                   ),

                   ],
                 ),




    );
  }
}

