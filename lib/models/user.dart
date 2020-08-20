class User{

  final String uid;

  User ({ this.uid });

  
}

class UserProfile{

  final String uid;
  final String name;
  final String goals;
  final String messageToSelf;
  final String currentBackgroundColor;

  UserProfile({this.uid, this.name, this.goals, this.messageToSelf, this.currentBackgroundColor});

}