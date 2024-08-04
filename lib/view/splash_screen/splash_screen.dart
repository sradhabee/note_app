import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:note_app/utils/animation_constants.dart';

import 'package:note_app/view/note_screen/note_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>NoteScreen() ,)));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset(AnimationConstants.splash_logo) ,
      ),
      
    );
  }
}



