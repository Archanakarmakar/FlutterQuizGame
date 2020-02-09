import 'package:flutter/material.dart';
import 'package:login/auth.dart';
import 'package:login/constants.dart';
import 'package:login/loading.dart';
//import 'package:flutter/services.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  //text field state
  String email='';
  String password='';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      resizeToAvoidBottomInset: false, // set it to false
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 0.0,
        title: Text('SignIn to Kids Quiz'),
        actions:<Widget>[
          FlutterLogo(size:60),

            FlatButton.icon(
              icon:Icon(Icons.person),
              label:Text('Register'),
              textColor: Colors.white,
              onPressed:  () {
              widget.toggleView();
              },

          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
         child: Form(
           key: _formKey,
          child:Column(
            children:<Widget>[
                SizedBox(height:20.0),
                TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Enter Email Address'),
                    validator: (val) => val.isEmpty ? 'Enter an email ID' : null,
                   onChanged:(val){
                   setState(()=> email = val);
                 }
                ),
                  SizedBox(height:20.0),
                 TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Enter Password'),
                    obscureText: true,
                    validator: (val) => val.length < 6 ? 'Enter an PWD 6+ Char Long' : null,
                    onChanged:(val){
                      setState(()=> password = val);
                       }
                ),
                 SizedBox(height:20.0),
                 RaisedButton(
                 color:Colors.blue,
                  child:Text(
                  'Sign In',
                   style:TextStyle(color:Colors.white),
                    ),
                  onPressed: ()async{
                  if (_formKey.currentState.validate()) {
                    setState(() => loading = true);
                    dynamic result = await  _auth.signInWithEmailandPassword(email, password);
                    //print('valid');
                    if (result == null){
                     setState(() {
                      error = 'Can not Sign in with This Credentials';
                      loading = false;
                      });
                                           }
                     }
                  }
                 ),

              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.redAccent, fontSize: 14.0),
              ),
              SizedBox(height: 0.0,),
              Text(
                  'Existing User Sign In Here\n\nNew User Click on Register'
              ),
            ],
               ),
               ),

      ),
    );

  }
}
