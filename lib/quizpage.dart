import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login/resultpage.dart';
import 'package:login/scoredetail.dart';



class getjson extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString("assets/quiz.json"),
      builder:(context,snapshot){
        List mydata = json.decode(snapshot.data.toString());
        if(mydata == null){
          return Scaffold(
            body:Center(
              child:Text(
                  "Loading"
              ),
            ),
          );
        }else{
          return quizpage(mydata : mydata);
        }
      },

    );
  }
}
class quizpage extends StatefulWidget {

  var mydata;
  quizpage({Key key,@required this.mydata}):super(key : key);

  @override
  _quizpageState createState() => _quizpageState(mydata);
}

class _quizpageState extends State<quizpage> {

  var mydata;
  _quizpageState(this.mydata);

  Color colortoshow = Colors.indigo;
  Color right = Colors.green;
  Color wrong = Colors.red;
  int marks = 0;
  int i=1;
  int timer = 30;
  String showtimer="30";
  String QA="";

  Map<String, Color> btncolor ={

    "a":Colors.indigo,
    "b":Colors.indigo,
    "c":Colors.indigo,
    "d":Colors.indigo,
  };
  bool canceltimer = false;
  @override
  void initState(){
    starttimer();
    super.initState();
  }

  void starttimer() async{
    const onesec = Duration(seconds : 1);
    Timer.periodic(onesec,(Timer t){
      setState(() {
        if (timer < 1){
          t.cancel();
          nextquestion();
        }else if(canceltimer == true){
          t.cancel();
        }
        else{
          timer = timer - 1;
        }
        showtimer = timer.toString();
      });
    });
  }
  void nextquestion(){
    canceltimer = false;
    timer = 30;
    setState(() {
      if(i<5){
        i++;
      }else{
        //Delete
        return showDialog(
            context: context,
            builder:(context)=> AlertDialog(
                title: Text(
                  "Your Final Score for the Quiz",
                ),
                content: Text(
                    "Score : $marks !!\n\nClick OK to see Details Q&A.",
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.indigo,
                    //fontFamily: "Satisfy",
                  ),
                ),
                actions:<Widget>[
                  FlatButton(
                    onPressed: (){
                          Navigator.of(context).pop();
                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder:(context) => scoredetail(QA: QA,),
                      ));
                    },
                    child: Text(
                      'Ok',
                    ),
                  )
      ],
                          )
        );
        //Delete
          Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder:(context) => scoredetail(QA: QA,),
        ));
      }
      btncolor["a"] = Colors.indigo;
      btncolor["b"] = Colors.indigo;
      btncolor["c"] = Colors.indigo;
      btncolor["d"] = Colors.indigo;
    });
    starttimer();
  }
  void checkanswer(String k) {
    if (mydata[2][i.toString()] == mydata[1][i.toString()][k]) {
      marks = marks + 5;
      QA=QA+ "\n\nQ:  "+ (mydata[0][i.toString()])+" -- Correct Ans: " +(mydata[2][i.toString()])+"  User Selection-"+(mydata[1][i.toString()][k]); // capture Answer
      colortoshow = right;
      print("$QA");
    }
    else
    {
      QA=QA+ "\n\nQ:  "+ (mydata[0][i.toString()])+" -- Correct Ans: " +(mydata[2][i.toString()])+"  User Selection-"+(mydata[1][i.toString()][k]); // capture Answer
      colortoshow = wrong;
      print("$QA");
    }
    setState(() {
      btncolor[k] = colortoshow;
      canceltimer = true;
    });
    Timer(Duration(seconds: 2),nextquestion);
  }
  Widget choicebutton(String k){
    return Padding(
        padding:EdgeInsets.symmetric(
          vertical:10.0,
          horizontal: 20.0,
        ),
        child:MaterialButton(
          onPressed: () => checkanswer(k),
          child:Text(
            mydata[1][i.toString()][k],
            //mydata[1]["1"][k],
            style:TextStyle(
              color: Colors.white,
              fontFamily:"Quando",
              fontSize: 16.0,
            ),
            maxLines:1,
          ),

          color:btncolor[k],
          splashColor:Colors.indigo[700],
          highlightColor:Colors.indigo[700] ,
          minWidth: 200.0,
          height:45.0,
          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,DeviceOrientation.portraitUp
    ]);

    return WillPopScope(
        onWillPop: (){
          return showDialog(
              context: context,
              builder:(context)=> AlertDialog(
                  title: Text(
                    "Quizstart",
                  ),
                  content: Text(
                      "You can't go back at this stage"
                  ),
                  actions:<Widget>[
                    FlatButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                      },

                      child: Text(
                        'Ok',
                      ),
                    )
                  ]
              )
          );
        },
        child: Scaffold(

          body:Column(
            children: <Widget>[
              Expanded(
                  flex:2,
                  child:Container(
                    padding:EdgeInsets.all(15.0),
                    alignment: Alignment.bottomLeft,
                    child:Text(
                      mydata[0][i.toString()],
                      style: TextStyle(
                          fontSize: 23.0,
                          fontFamily: "Quando",
                          color: Colors.black,
                      ),

                    ),
                  )
              ),
              Expanded(
                  flex:6,
                  child:Container(
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center ,
                      children: <Widget>[
                        choicebutton('a'),
                        choicebutton('b'),
                        choicebutton('c'),
                        choicebutton('d'),
                      ],
                    ),
                  )
              ),
              // Delete
              Expanded(
                  flex:1,
                  child:Container(
                    padding:EdgeInsets.all(15.0),
                    alignment: Alignment.bottomLeft,
                    child:Text(
                      'Your Score $marks',
                      style: TextStyle(
                          fontSize: 27.0,
                          fontFamily: "Quando"

                      ),

                    ),
                  )
              ),
              // Delete
              Expanded(
                  flex:1,
                  child:Container(
                    alignment:Alignment.topCenter ,
                    child:Center(
                    //  label:Text("Countdown"),
                      child:Text(
                          showtimer,
                        style:TextStyle(
                          fontSize:35.0,
                          fontWeight:FontWeight.w700,
                          fontFamily: 'Times New Roman',
                        ),

                      ) ,
                    ),
                  )
              ),
            ],
          ),

        )
    );


  }
}
