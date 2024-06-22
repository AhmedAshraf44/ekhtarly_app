import 'package:ekhtarly_app/features/home/data/model/profile.dart';
import 'package:ekhtarly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.homeRepo) : super(ProfileInitial());
  final HomeRepo homeRepo;
  Future<void> getProfile() async {
    var result = await homeRepo.getprofile();

    result.fold(
        (failure) => emit(
              ProfileFaluire(
                message: failure.errorMessage,
              ),
            ), (profile) {
      emit(
        ProfileSuccess(profile: profile),
      );
    });
  }
}
