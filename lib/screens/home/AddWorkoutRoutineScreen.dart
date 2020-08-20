import 'package:flutter/material.dart';
class AddWorkoutRoutineScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text(
            'Add Workout Routine Screen',
            ),
            Icon(Icons.directions_transit),
          ], // <Widget>[]
      ), // Column
    ); // Container
  }
}
