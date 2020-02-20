import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:streaming_app/LoginPage.dart';
import 'package:streaming_app/cameraView.dart';
class HomePage extends StatefulWidget{
  FirebaseUser user;
  HomePage(this.user);
  @override
  _HomePageState createState() => _HomePageState(user);
}

class _HomePageState extends State<HomePage> {
  FirebaseUser user;
  FirebaseAuth firebaseAuth=FirebaseAuth.instance;
  _HomePageState(this.user);
  @override
  void initState()
  {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.email),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.exit_to_app), onPressed:null),
        ],
      ),
      body: CameraApp()
    );
  }
}