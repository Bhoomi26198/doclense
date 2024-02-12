import 'package:doclense/constants/app_strings.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        color: Colors.blueGrey,
      ),
      Center(
        child: Text(
          AppStrings.flutterDemo,
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      )
    ]));
  }
}
