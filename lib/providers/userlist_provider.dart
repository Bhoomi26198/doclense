import 'package:doclense/data/modals/userList_modal.dart';
import 'package:flutter/material.dart';

class UserListProviser extends ChangeNotifier {
  List<UserListModal?> userLists = [];

  setUserListData(List<UserListModal?> values) {
    userLists = [];
    userLists.addAll(values.map((e) => e));
    notifyListeners();
  }

  removeUserList(UserListModal value) {
    userLists.removeWhere((e) => e!.name == value.name);
    notifyListeners();
  }
}
