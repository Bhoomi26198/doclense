// ignore: file_names
import 'package:doclense/data/modals/login_modal.dart';

abstract class SignInState {}

class SignInInitialState extends SignInState {}

class SignInLoadingState extends SignInState {}

class SignInSuccessState extends SignInState {
  final LoginModal? signInModal;
  SignInSuccessState({this.signInModal});
}

class SignInErrorState extends SignInState {
  final String? error;
  SignInErrorState({this.error});
}
