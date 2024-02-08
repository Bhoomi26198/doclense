import 'package:doclense/blocs/login/login_event.dart';
import 'package:doclense/blocs/login/login_state.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginIntialState()) {
    on<LoginEmailChangesEvent>((event, emit) {
      if (EmailValidator.validate(event.emailValue)) {
        emit(LoginErrorState("Invalid email address"));
      } else {
        emit(LoginValidState());
      }
    });

    on<LoginPasswordChangesEvent>((event, emit) {
      if (event.passwordValue.length < 8) {
        emit(LoginErrorState("Please enter valid password"));
      } else {
        emit(LoginValidState());
      }
    });

    on<LoginSubmittedEvent>((event, emit) {
      emit(LoginLodingState());
    });
  }
}
