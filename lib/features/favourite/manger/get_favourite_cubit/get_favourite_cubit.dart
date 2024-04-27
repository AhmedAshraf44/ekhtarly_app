import 'package:ekhtarly_app/features/favourite/data/repos/favourite_repo.dart';
import 'package:ekhtarly_app/features/favourite/manger/get_favourite_cubit/get_favourite_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit(this.favouriteRepo) : super(FavouritInitial());
  final FavouriteRepo favouriteRepo;
  Future<void> getFavorites() async {
    emit(FavouritLoading());
    var result = await favouriteRepo.getFavourite();
    result.fold(
      (failure) => emit(
        FavouritFailure(errorMessage: failure.errorMessage),
      ),
      (favourite) => emit(
        FavouritSuccess( favourite: favourite),
      ),
    );
  }

  
}
