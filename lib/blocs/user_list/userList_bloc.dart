import 'dart:developer';

import 'package:doclense/blocs/user_list/userList_event.dart';
import 'package:doclense/blocs/user_list/userList_state.dart';
import 'package:doclense/data/modals/response_modal.dart';
import 'package:doclense/data/modals/userList_modal.dart';
import 'package:doclense/data/repositories/post_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserListbloc extends Bloc<UserListEvent, UserListState> {
  UserListbloc() : super(UserListIntial()) {
    on<GetUserListEvent>((event, emit) async {
      List<UserListModal> list = [];
      try {
        ResponseModel responseModel =
            ResponseModel.fromJson(await getUserListApi());
        if (responseModel.status == true) {
          for (var a in responseModel.data) {
            list.add(UserListModal.fromJson(a));
          }
          emit(UserListSuccessState(userListModal: list));
        } else {
          if (responseModel.statusCode == 401) {
            emit(UserListErrorState(error: responseModel.message));
          } else {
            emit(UserListErrorState(error: responseModel.message));
          }
        }
      } catch (e) {
        log("Error${e}");
      }
    });
  }
}
