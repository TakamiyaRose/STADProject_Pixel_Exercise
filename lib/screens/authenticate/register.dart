import 'package:flutter/material.dart';
import 'package:pixel_exercise/services/auth.dart';
import 'package:pixel_exercise/shared/constants.dart';
import 'package:pixel_exercise/shared/loading.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({ this.toggleView });

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  final List<String> backgroundColors = ['Red', 'Blue', 'Pink', 'Green', 'Orange'];


  // text field state
  String email = '';
  String name = '';
  String password = '';
  String goals = '';
  String messageToSelf = '';
  String error = '';
  String currentBackgroundColor;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() :  Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign up for Pixel Exercise'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign In'),
            onPressed: () => widget.toggleView(),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'email'),
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'password'),
                obscureText: true,
                validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'What should we call you?'),
                validator: (val) => val.isEmpty ? 'Enter your Name' : null,
                onChanged: (val) {
                  setState(() => name = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'What are your current Goals'),
                onChanged: (val) {
                  setState(() => goals = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Please give yourself a motivational message'),
                onChanged: (val) {
                  setState(() => messageToSelf = val);
                },
              ),
              SizedBox(height: 20.0),
              DropdownButtonFormField(
                value: currentBackgroundColor ?? 'Pink',
                decoration: textInputDecoration.copyWith(hintText: 'Please select your favourite colour'),
                items: backgroundColors.map((backgroundColor) {
                  return DropdownMenuItem(
                    value: backgroundColor,
                    child: Text('$backgroundColor'),
                  );
                }).toList(),
                onChanged: (val){
                  setState(() => currentBackgroundColor = val);
                } 
                ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if(_formKey.currentState.validate()){
                    setState(() => loading = true);
                    dynamic result = await _auth.registerWithEmailAndPassword(email, password, goals, messageToSelf, name, currentBackgroundColor);
                    if(result == null) {
                      setState(() {
                        loading = false;
                        error = 'Please supply a valid email';
                      });
                    }
                  }
                }
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}