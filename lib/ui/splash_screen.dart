import 'dart:developer';

import 'package:doclense/constants/app_strings.dart';
import 'package:doclense/data/modals/login_modal.dart';
import 'package:doclense/preferences/preferences_helper.dart';
import 'package:doclense/providers/profile_provider.dart';
import 'package:doclense/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  LoginModal? userData;
  static const String USER = "user";
  var data = false;

  @override
  void initState() {
    getUser();
    super.initState();
  }

  getUser() async {
    var prefs = await SharedPreferences.getInstance();
    var val = prefs.getString(USER);

    setState(() {
      data = val != null ? true : false;
    });

    var user = await PreferencesHelper.getUserDetails();
    if (data) {
      Provider.of<UserDetailsProvider>(context, listen: false)
          .setUserDetails(user!);
    }
  }

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
