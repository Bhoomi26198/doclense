abstract class LoginEvent {}

class LoginEmailChangesEvent extends LoginEvent {
  final String emailValue;
  LoginEmailChangesEvent(this.emailValue);
}

class LoginPasswordChangesEvent extends LoginEvent {
  final String passwordValue;
  LoginPasswordChangesEvent(this.passwordValue);
}

class LoginSubmittedEvent extends LoginEvent {
  final String email;
  final String password;
  LoginSubmittedEvent(this.email, this.password);
}
