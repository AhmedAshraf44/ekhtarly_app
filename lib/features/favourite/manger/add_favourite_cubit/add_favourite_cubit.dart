import 'package:ekhtarly_app/features/favourite/data/repos/favourite_repo.dart';
import 'package:ekhtarly_app/features/favourite/manger/add_favourite_cubit/add_favourite_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddFavouriteCubit extends Cubit<AddFavouriteState> {
  AddFavouriteCubit(this.favouriteRepo) : super(AddFavouritInitial());
  final FavouriteRepo favouriteRepo;
  Future<void> addToFavorites() async {
    emit(AddFavouritLoading());
    var result = await favouriteRepo.addToFavourite();
    result.fold(
      (failure) => emit(
        AddFavouritFailure(errorMessage: failure.errorMessage),
      ),
      (favourite) => emit(
        AddFavouritSuccess(favourite: favourite),
      ),
    );
  }
}
