import 'dart:core';
import 'dart:async';
import 'package:flutter/material.dart';

import 'package:otus_home_food/home_screen.dart';

const TextStyle unselectText=
    TextStyle(color: unselectTextColor, fontSize: 70);
const Color unselectTextColor = Colors.black;

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

// Create a widget state
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Create a timer to switch SplashScreen to HomeScreen after 2 seconds.
    Timer(
      Duration(seconds: 2),

      () { runApp(HomeScreen()); }
    );
  }

  // Widget creation
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('HOME', style: unselectText,),
            Text('OTUS', style: unselectText,),
            Text('FOODS', style: unselectText,),
          ],
        ),
      ),
    );
  }

}