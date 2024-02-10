import 'package:flutter/cupertino.dart';

class ProfileProvider with ChangeNotifier {
  bool? isEligible;
  String? eligibilityMsg = "";

  void checkAgeEligibility(int age) {
    if (age == null) {
      isEligible = false;
      eligibilityMsg = "Please enter your age";
    } else if (age >= 18) {
      isEligible = true;
      eligibilityMsg = "You are eligible";
      notifyListeners();
    } else {
      isEligible = false;
      eligibilityMsg = "You are not eligible";
      notifyListeners();
    }
  }
}
