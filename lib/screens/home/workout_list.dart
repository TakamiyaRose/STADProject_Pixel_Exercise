import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pixel_exercise/models/workout.dart';
import 'package:provider/provider.dart';
import 'package:pixel_exercise/screens/home/workout_tile.dart';

class WorkoutList extends StatefulWidget {
  @override
  _WorkoutListState createState() => _WorkoutListState();
}

class _WorkoutListState extends State<WorkoutList> {
  @override
  Widget build(BuildContext context) {

    final workouts = Provider.of<List<Workout>>(context) ?? [];
    return ListView.builder(
      itemCount: workouts.length,
      itemBuilder: (context, index) {
        return WorkoutTile(workout : workouts[index]);
      }
    );
  }
}