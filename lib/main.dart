import 'package:doclense/login.dart';
import 'package:doclense/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: HomePage()
        home: AnimatedSplashScreen(
          splash: SplashScreen(),
          nextScreen: Login(),
          splashTransition: SplashTransition.fadeTransition,
        ));
  }
}
