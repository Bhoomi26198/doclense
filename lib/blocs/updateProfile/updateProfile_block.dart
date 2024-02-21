import 'dart:developer';

import 'package:doclense/blocs/updateProfile/updateProfile_event.dart';
import 'package:doclense/blocs/updateProfile/updateProfile_state.dart';
import 'package:doclense/data/modals/profile.dart';
import 'package:doclense/data/modals/response_modal.dart';
import 'package:doclense/data/repositories/post_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateProfileBloc extends Bloc<UpdateProfileEvent, UpdateProfileState> {
  UpdateProfileBloc() : super(UpdateprofileInitialState()) {
    on<UpdateProfileEvent>(
      (event, emit) async {
        emit(UpdateProfileLoadingState());
        try {
          ResponseModel responseModel = ResponseModel.fromJson(
              await updateUserprofile(event.firstname!, event.lastname!,
                  event.email!, event.image ?? ""));

          if (responseModel.status == true) {
            log("message-----------");
            UserProfileModel userProfileModel =
                UserProfileModel.fromJson(responseModel.data!);
            emit(UpdateProfileSuccessState(userProfileModel: userProfileModel));
          } else {
            emit(UpdateProfileErrorState(error: responseModel.message));
          }
        } catch (e) {
          log("Error---${e}");
          emit(UpdateProfileErrorState(error: e.toString()));
        }
      },
    );
  }
}
