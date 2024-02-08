abstract class LoginState {}

class LoginIntialState extends LoginState {}

class LoginValidState extends LoginState {}

class LoginErrorState extends LoginState {
  final String errorMsg;
  LoginErrorState(this.errorMsg);
}

class LoginLodingState extends LoginState {}
