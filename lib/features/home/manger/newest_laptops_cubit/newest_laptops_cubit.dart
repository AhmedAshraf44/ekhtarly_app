import 'package:ekhtarly_app/features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'newest_laptops_state.dart';

class NewestLaptopsCubit extends Cubit<NewestLaptopsState> {
  NewestLaptopsCubit(this.homeRepo) : super(NewestLaptopsInitial());

  final HomeRepo homeRepo;
  Future<void> getNewestLaptops() async {
    emit(NewestLaptopsLoading());
    var result = await homeRepo.getNewestLaptops();
    result.fold(
      (failure) => emit(
        NewestLaptopsFailure(
          errorMessage: failure.errorMessage,
        ),
      ),
      (laptops) {
         emit(
        NewestLaptopsSuccess(laptops: laptops),
      );
      }
    );

  }
}
