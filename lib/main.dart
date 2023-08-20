import 'package:flutter/material.dart';
import 'package:otus_home_food/home_screen.dart';
import 'package:otus_home_food/splash_screen.dart';

// Application launch
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  // Redefine widget instance construction method
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen()
    );
  }
}