import 'package:flutter/material.dart';
import 'package:pixel_exercise/screens/home/workout_list.dart';
import 'package:pixel_exercise/screens/home/settings_form.dart';
import 'package:pixel_exercise/services/auth.dart';
import 'package:pixel_exercise/services/database.dart';
import 'package:provider/provider.dart';
import 'package:pixel_exercise/models/workout.dart';

class WorkoutScreen extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Workout>>.value(
        value: DatabaseService().workouts,
        child: Scaffold(
        backgroundColor: Colors.brown[50],
        body: WorkoutList(),
      ),
    );
  }
}