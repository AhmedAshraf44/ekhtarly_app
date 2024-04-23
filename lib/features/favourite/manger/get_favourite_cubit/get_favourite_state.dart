import '../../data/model/favourite_model/favourite_model.dart';

abstract class FavouriteState {}

final class AddFavouritInitial extends FavouriteState {}

final class AddFavouritLoading extends FavouriteState {}

final class AddFavouritSuccess extends FavouriteState {
  final FavouriteModel favourite;

  AddFavouritSuccess({required this.favourite});
}

final class AddFavouritFailure extends FavouriteState {
  final String errorMessage;
  AddFavouritFailure({required this.errorMessage});
}
