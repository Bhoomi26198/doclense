import 'dart:developer';

import 'package:doclense/blocs/signIn/signIn_event.dart';
import 'package:doclense/blocs/signIn/signIn_state.dart';
import 'package:doclense/data/modals/login_modal.dart';
import 'package:doclense/data/modals/response_modal.dart';
import 'package:doclense/data/repositories/post_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInSubmitEvent, SignInState> {
  SignInBloc() : super(SignInInitialState()) {
    on<SignInSubmitEvent>(
      (event, emit) async {
        emit(SignInLoadingState());
        try {
          ResponseModel responseModel = ResponseModel.fromJson(
              await login(event.email!, event.password!));

          if (responseModel.status == true) {
            LoginModal userProfileModel =
                LoginModal.fromJson(responseModel.data!);
            emit(SignInSuccessState(signInModal: userProfileModel));
          } else {
            emit(SignInErrorState(error: responseModel.message));
          }
        } catch (e) {
          log("Error---${e}");
          emit(SignInErrorState(error: e.toString()));
        }
      },
    );
  }
}
