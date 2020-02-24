import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:streaming_app/cameraView.dart';
import 'package:flutter_android_pip/flutter_android_pip.dart';
import 'package:flutter_screen_recording/flutter_screen_recording.dart';
// import 'package:flutter_screen_recorder/flutter_screen_recorder.dart';
class HomePage extends StatefulWidget{
  FirebaseUser user;
  HomePage(this.user);
  @override
  _HomePageState createState() => _HomePageState(user);
}

class _HomePageState extends State<HomePage> {
  bool pip=false;
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
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text(user.email),
    //     actions: <Widget>[
    //       IconButton(icon: Icon(Icons.exit_to_app), onPressed:null),
    //     ],
    //   ),
      // body:
       return ListView(
        children: <Widget>[
          CameraApp(pip),
          RaisedButton(
            child: Text("Start Recording"),
            onPressed: () async{
              await FlutterScreenRecording.startRecordScreen("Abc");
              FlutterAndroidPip.enterPictureInPictureMode;
              setState(() {
                pip=true;
              });
          }),
          RaisedButton(
            child: Text("Stop Recording"),
            onPressed: () async{
             final result=await FlutterScreenRecording.stopRecordScreen;
          })
        ],
      );
    // );
  }
}