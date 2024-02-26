import 'package:doclense/data/modals/login_modal.dart';
import 'package:flutter/cupertino.dart';

class ProfileProvider with ChangeNotifier {
  bool? isEligible;
  String? eligibilityMsg = "";

  void checkAgeEligibility(int age) {
    if (age >= 18) {
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

class UserDetailsProvider extends ChangeNotifier {
  LoginModal? _userDetails;

  LoginModal? get userDetails => _userDetails;

  setUserDetails(LoginModal user) {
    _userDetails = user;
    notifyListeners();
  }
}
