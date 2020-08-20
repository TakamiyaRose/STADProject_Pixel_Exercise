import 'package:flutter/material.dart';
class AboutUsScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: new Column(
      children: <Widget>[
        new Card(
          margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
          child: ListTile(
            leading: Icon(Icons.apps),
            title: Text('Our App'),
            subtitle: Text('An app that helps with time management by pre scheduling workout time to kick out the excuse of not having enough time to exercise. \nWe at Scuffed ENT. wanted to create a internal app to motivate our employees to exercise more, and it worked out so well that we now make this public to share with the world'),
            isThreeLine: true,
          ),
        ),
        new Card(
          margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
          child: ListTile(
            leading: Icon(Icons.business),
            title: Text('About The Company'),
            subtitle: Text('Creating Apps for the people \nScuffed ENT is a company based in Singapore striving to solve the common problems of Singaporeans with the use of mobile app technology.'),
            isThreeLine: true,
          ),
        ),
        new Card(
          margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
          child: ListTile(
            leading: Icon(Icons.call),
            title: Text('Get in touch with us'),
            subtitle: Text('Call us : +65 98538263\nEmail Us : ConnectingOurSenses@gmail.com'),
            isThreeLine: true,
          ),
        ),
],
    ),
);
  }
}