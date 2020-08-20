import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pixel_exercise/models/workout.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference workoutCollection = Firestore.instance.collection('workout');

  Future<void> updateUserData(int dayNum, String dayName, String workoutName, String workoutTime, String workoutDuration, String workoutGoal) async {
    return await workoutCollection.document(uid).setData({
      'dayNum': dayNum,
      'dayName': dayName,
      'workoutName': workoutName,
      'workoutTime': workoutTime,
      'workoutDuration': workoutDuration,
      'workoutGoal': workoutGoal
    });
  }

    // workout list from snapshot
  List<Workout> _workoutListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      //print(doc.data);
      return Workout(
        dayNum: doc.data['dayNum'] ?? 0,
        dayName: doc.data['dayName'] ?? '',
        workoutName: doc.data['workoutName'] ?? '',
        workoutTime: doc.data['workoutTime'] ?? '',
        workoutDuration: doc.data['workoutDuration'] ?? '',
        workoutGoal: doc.data['workoutGoal'] ?? ''
      );
    }).toList();
  }

  //get workouts stream
    Stream<List<Workout>> get workouts {
    return workoutCollection.snapshots()
    .map(_workoutListFromSnapshot);
  }

}