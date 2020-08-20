import 'package:flutter/material.dart';
import 'package:pixel_exercise/screens/wrapper.dart';
import 'package:pixel_exercise/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:pixel_exercise/models/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
          ),
    );
  }
}