import 'dart:developer';

import 'package:ekhtarly_app/features/favourite/presentation/manger/add_favourite_cubit/add_favourite_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/favourite_repo.dart';

class AddFavouriteCubit extends Cubit<AddFavouriteState> {
  AddFavouriteCubit(this.favouriteRepo) : super(AddFavouritInitial());
  final FavouriteRepo favouriteRepo;
Future<void> addToFavorites({required String id}) async {
    log(id);
    var result = await favouriteRepo.addToFavourite(id: id);
    result.fold(
       (failure) => emit(
        AddFavouritFailure(errorMessage: failure.errorMessage),
      ),
      (favourite) {
        log('true');
        return emit(
        AddFavouritSuccess(),
      );
      }
    );
  }
}