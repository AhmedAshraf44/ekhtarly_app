import 'dart:developer';

import 'package:ekhtarly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit(this.homeRepo) : super(ChangePasswordInitial());
  final HomeRepo homeRepo;
  String? password;

  Future<void> changepassword(Map<String, String> body) async {
    try {
      emit(ChangePasswordInitial());
      var data = await homeRepo.changePassword(body);
      data.fold(
          (failure) =>
              emit(ChangePasswordfailure(message: failure.errorMessage)),
          (message) {
        if (message['state'] == 'Fail') {
          emit(ChangePasswordfailure(message: message['message']!));
        } else {
          emit(ChangePasswordSuccess(message: message['message']!));
        }
      });
    } catch (e) {
      log(e.toString());
    }
  }
}
