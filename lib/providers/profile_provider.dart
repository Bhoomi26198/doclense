import 'package:doclense/data/modals/login_modal.dart';
import 'package:flutter/cupertino.dart';

class UserDetailsProvider extends ChangeNotifier {
  LoginModal? _userDetails;

  LoginModal? get userDetails => _userDetails;

  setUserDetails(LoginModal user) {
    _userDetails = user;
    notifyListeners();
  }
}
