import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pixel_exercise/models/user.dart';

class UserProfileDatabaseService {

  final String uid;
  UserProfileDatabaseService({ this.uid });

  // collection reference
  final CollectionReference userProfileCollection = Firestore.instance.collection('userProfile');

  Future<void> updateUserProfileData(String name, String goals, String messageToSelf, String currentBackgroundColor) async {
    return await userProfileCollection.document(uid).setData({
      'name': name,
      'goals': goals,
      'messageToSelf': messageToSelf,
      'currentBackgroundColor': currentBackgroundColor,
    });
  }

    //userData from snapshot
  UserProfile _userDataFromSnapshot(DocumentSnapshot snapshot){
    return UserProfile(
      uid: uid,
      name: snapshot.data['name'],
      goals: snapshot.data['goals'],
      messageToSelf: snapshot.data['messageToSelf'],
      currentBackgroundColor: snapshot.data['currentBackgroundColor'],
    );
  }

  Stream<UserProfile> get userProfile {
    return userProfileCollection.document(uid).snapshots()
      .map(_userDataFromSnapshot);
  }

}