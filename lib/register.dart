import 'package:flutter/material.dart';
import 'package:login/auth.dart';
import 'package:login/constants.dart';
import 'package:login/loading.dart';
import 'package:flutter/services.dart';



class Register extends StatefulWidget {

  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        elevation: 0.0,
        title: Text('Register to Kids Quiz'),
        actions:<Widget>[
          FlatButton.icon(
            icon:Icon(Icons.person),
            label:Text('Sign In'),
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
                    obscureText: true,
                    decoration: textInputDecoration.copyWith(hintText: 'Enter Password'),
                    validator: (val) => val.length < 6 ? 'Enter an PWD 6+ Char Long' : null,
                    onChanged:(val){
                      setState(()=> password = val);
                    }
                ),
                SizedBox(height:20.0),
                RaisedButton(
                  color:Colors.pink[400],
                  child:Text(
                    'Sign in',
                    style:TextStyle(color:Colors.white),
                  ),
                  onPressed: ()async {
                    if (_formKey.currentState.validate()) {
                      setState(() => loading = true);
                      dynamic result = await _auth.registerWithEmailandPassword(email, password);
                      if (result == null){
                        setState(() {
                          error =
                          'Please Supply a Valid Email Address for Register';
                          loading = false;
                        });

                        }
                      }
                    }
                ),
                SizedBox(height: 12.0),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                ),
                ],
          ),
        ),
      ),
    );
  }
}
