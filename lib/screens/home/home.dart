import 'package:flutter/material.dart';
import 'package:pixel_exercise/screens/home/settings_form.dart';
import 'package:pixel_exercise/services/auth.dart';
import 'package:pixel_exercise/models/user.dart';
import 'package:pixel_exercise/services/userProfile.dart';
import 'package:pixel_exercise/shared/loading.dart';
import 'package:provider/provider.dart';

import 'AboutUsScreen.dart';
import 'AddWorkoutRoutineScreen.dart';
import 'WorkoutScreen.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

      void _showSettingsPanel() {
        showModalBottomSheet(context: context, builder: (context){
          return Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
            child: SettingsForm(),
          );
        });
      }
      
      return StreamBuilder<UserProfile>(
        stream: UserProfileDatabaseService(uid : user.uid).userProfile,
        builder: (context, snapshot) {

          

          if(snapshot.hasData){
          UserProfile userProfile = snapshot.data;
          int backgroundColor = 0xFFF48FB1; //in case if-else code is broken, default is pink
          String currentBackgroundColor = userProfile.currentBackgroundColor;
          if (currentBackgroundColor == 'Red'){
            backgroundColor = 0xFFEF9A9A;
          } else if (currentBackgroundColor == 'Blue'){
            backgroundColor = 0xFF90CAF9;
          } else if (currentBackgroundColor == 'Pink'){
            backgroundColor = 0xFFF48FB1;
          } else if (currentBackgroundColor == 'Green'){
            backgroundColor = 0xFFA5D6A7;
          } else if (currentBackgroundColor == 'Orange'){
            backgroundColor = 0xFFFFCC80;
          }
            return MaterialApp(
              home: DefaultTabController(
              length: 3,
                child: Scaffold(
                backgroundColor: Colors.brown[50],
                appBar: AppBar(
                  title: Text('Pixel Exercise'),
                  backgroundColor: Color(backgroundColor),
                  elevation: 0.0,
                  actions: <Widget>[
                    FlatButton.icon(
                      icon: Icon(Icons.eject),
                      label: Text('Logout'),
                      onPressed: () async {
                        await _auth.signOut();
                      },
                    ),
                    FlatButton.icon(
                      icon: Icon(Icons.person),
                      label: Text('Profile'),
                      onPressed: () => _showSettingsPanel(),
                    ),
                  ],
                bottom: TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.airline_seat_legroom_normal, color: Colors.yellow,)),
                    Tab(icon: Icon(Icons.add_alert, color: Colors.greenAccent,)),
                    Tab(icon: Icon(Icons.people)),
                    ],
                  ),
                ),
                body: 
                TabBarView(
                  children: [
                    WorkoutScreen(), 
                    AddWorkoutRoutineScreen(),
                    AboutUsScreen(),
                  ],
                ),
              ),
            )
    );
        }else{
          return Loading();
        }
        }
      );
  }
}