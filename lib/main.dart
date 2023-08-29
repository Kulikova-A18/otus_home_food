import 'package:flutter/material.dart';
import 'package:otus_home_food/screens/splash_screen.dart';

import 'package:otus_home_food/testexample.dart';

// Application launch
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // Redefine widget instance construction method
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //
        //home: SplashScreen()
        home: Testexample()
        //
        );
  }
}
