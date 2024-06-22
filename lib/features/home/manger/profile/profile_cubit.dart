import 'package:ekhtarly_app/features/home/data/model/profile.dart';
import 'package:ekhtarly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.homeRepo) : super(ProfileInitial());
  final HomeRepo homeRepo;
  late Profile myprofile;

  Future<void> getProfile() async {
    var result = await homeRepo.getprofile();
<<<<<<< HEAD

=======
>>>>>>> 972a371abda74f5579881c1e7c40d5508fa3ef30
    result.fold(
        (failure) => emit(
              ProfileFaluire(
                message: failure.errorMessage,
              ),
            ), (profile) {
      myprofile = profile;
      emit(
        ProfileSuccess(profile: profile),
      );
    });
<<<<<<< HEAD
=======
  }

  Profile getmyprofile() {
    return myprofile;
>>>>>>> 972a371abda74f5579881c1e7c40d5508fa3ef30
  }
}
