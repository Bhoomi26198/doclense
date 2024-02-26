import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  Color mainColor = Colors.blueGrey;

  void changeThemeColor(Color color) {
    mainColor = color;
    notifyListeners();
  }
}
