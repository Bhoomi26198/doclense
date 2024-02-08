import 'package:doclense/blocs/internet_bloc/internet_bloc.dart';
import 'package:doclense/blocs/login/login_bloc.dart';
import 'package:doclense/ui/login.dart';
import 'package:doclense/ui/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: Colors.blueGrey[50]),
        home: AnimatedSplashScreen(
          splash: SplashScreen(),
          nextScreen: BlocProvider(
            create: (context) => LoginBloc(),
            child: Login(),
          ),
          splashTransition: SplashTransition.fadeTransition,
        ),
        // onGenerateRoute:,
      ),
    );
  }
}
