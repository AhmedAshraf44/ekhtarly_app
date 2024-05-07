import 'dart:developer';
import 'package:ekhtarly_app/features/favourite/presentation/manger/add_favourite_cubit/add_favourite_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repos/favourite_repo.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit(this.favouriteRepo) : super(FavouriteInitial());
  final FavouriteRepo favouriteRepo;

Future<void> displayFavourite() async {
    var result = await favouriteRepo.displayFavourite();
    result.fold(
       (failure) => emit(
        FavouriteFailure(errorMessage: failure.errorMessage),
      ),
      (favourite) {
        log('true');
        return emit(
        DisplayFavourite(favoriteList: favourite),
      );
      }
    );
  }


Future<void> addToFavorites({required String id}) async {
    log(id);
    var result = await favouriteRepo.addToFavourite(id: id);
    result.fold(
       (failure) => emit(
        FavouriteFailure(errorMessage: failure.errorMessage),
      ),
      (favourite) {
        log('true');
        return emit(
        AddFavourite(addFavotiteModel:favourite ),
      );
      }
    );
  }


  Future<void> deleteToFavourite({required String id}) async {
    log(id);
    var result = await favouriteRepo.deleteToFavourite(id: id);
    result.fold(
       (failure) => emit(
        FavouriteFailure(errorMessage: failure.errorMessage),
      ),
      (favourite) {
        log('true');
        return emit(
        DeleteFavourite(deleteFavoriteModel: favourite),
      );
      }
    );
  }
}