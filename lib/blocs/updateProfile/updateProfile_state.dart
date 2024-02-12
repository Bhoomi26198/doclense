import 'package:doclense/data/modals/profile.dart';

abstract class UpdateProfileState {}

class UpdateprofileInitialState extends UpdateProfileState {}

class UpdateProfileSuccessState extends UpdateProfileState {
  final UserProfileModel? userProfileModel;
  UpdateProfileSuccessState({this.userProfileModel});
}

class UpdateProfileErrorState extends UpdateProfileState {
  final String? error;
  UpdateProfileErrorState({this.error});
}

class UpdateProfileLoadingState extends UpdateProfileState {}
