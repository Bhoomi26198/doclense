import 'package:doclense/data/modals/userList_modal.dart';

abstract class UserListState {}

class UserListIntial extends UserListState {}

class UserListSuccessState extends UserListState {
  final List<UserListModal?>? userListModal;
  UserListSuccessState({this.userListModal});
}

class UserListErrorState extends UserListState {
  final String? error;
  UserListErrorState({this.error});
}

class UserListLoadingState extends UserListState {}
