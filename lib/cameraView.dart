import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

List<CameraDescription> cameras;

class CameraApp extends StatefulWidget {
  bool pip;
  CameraApp(this.pip);
  @override
  _CameraAppState createState() => _CameraAppState(pip);
}

class _CameraAppState extends State<CameraApp> {
  CameraController controller;
  bool pip;
  _CameraAppState(this.pip);
  call() async{
    cameras = await availableCameras();
    controller = CameraController(cameras[1], ResolutionPreset.medium);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }
  @override
  void initState() {
    super.initState();
    call();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // if (!controller.value.isInitialized) {
    //   return Container();
    // }
    double aspectRatio=controller.value.aspectRatio;
    if(pip)
    aspectRatio=1/1;
    return 
        controller!=null
        ? AspectRatio(
          aspectRatio:aspectRatio,
          child: CameraPreview(controller))
         :Center(
           child: CircularProgressIndicator(
        ),
         );
  }
}