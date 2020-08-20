import 'package:flutter/material.dart';
import 'package:pixel_exercise/models/user.dart';
import 'package:pixel_exercise/services/database.dart';
import 'package:pixel_exercise/services/userProfile.dart';
import 'package:pixel_exercise/shared/constants.dart';
import 'package:pixel_exercise/shared/loading.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
   final _formKey = GlobalKey<FormState>();
  final List<String> backgroundColors = ['Red', 'Blue', 'Pink', 'Green', 'Orange'];

  // form values
  String _currentName;
  String _currentBackgroundColor;
  String _currentGoals;
  String _currentMessageToSelf;

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    return StreamBuilder<UserProfile>(
      stream: UserProfileDatabaseService(uid : user.uid).userProfile,
      builder: (context, snapshot) {
        if(snapshot.hasData){

          UserProfile userProfile = snapshot.data;

          return Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Text(
                  'Profile',
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  initialValue: userProfile.name,
                  decoration: textInputDecoration.copyWith(hintText: 'Please enter a name'),
                  validator: (val) => val.isEmpty ? 'Please enter a name' : null,
                  onChanged: (val) => setState(() => _currentName = val),
                ),
                SizedBox(height: 10.0),
                DropdownButtonFormField(
                  value: _currentBackgroundColor ?? userProfile.currentBackgroundColor,
                  decoration: textInputDecoration,
                  items: backgroundColors.map((backgroundColor) {
                    return DropdownMenuItem(
                      value: backgroundColor,
                      child: Text('$backgroundColor'),
                    );
                  }).toList(),
                  onChanged: (val) => setState(() => _currentBackgroundColor = val ),
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  initialValue: userProfile.goals,
                  decoration: textInputDecoration.copyWith(hintText: 'What are your current Goals'),
                  validator: (val) => val.isEmpty ? 'What are your current Goals' : null,
                  onChanged: (val) => setState(() => _currentGoals = val),
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  initialValue: userProfile.messageToSelf,
                  decoration: textInputDecoration.copyWith(hintText: 'Please give yourself a motivational message'),
                  validator: (val) => val.isEmpty ? 'Please give yourself a motivational message' : null,
                  onChanged: (val) => setState(() => _currentMessageToSelf = val),
                ),
                SizedBox(height: 10.0),
                RaisedButton(
                  color: Colors.pink[400],
                  child: Text(
                    'Update Profile',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if(_formKey.currentState.validate()){
                      await UserProfileDatabaseService(uid : user.uid).updateUserProfileData(
                        _currentName ?? userProfile.name,
                        _currentGoals ?? userProfile.goals,
                        _currentMessageToSelf ?? userProfile.messageToSelf,
                        _currentBackgroundColor ?? userProfile.currentBackgroundColor
                      );
                      Navigator.pop(context);
                    }
                  }
                ),
              ],
            ),
          );
        }else{
          return Loading();
        }
      }
    );
  }
}