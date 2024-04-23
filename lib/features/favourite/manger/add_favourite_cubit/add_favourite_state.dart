import '../../data/model/favourite_model/favourite_model.dart';

abstract class AddFavouriteState {}

final class AddFavouritInitial extends AddFavouriteState {}

final class AddFavouritLoading extends AddFavouriteState {}

final class AddFavouritSuccess extends AddFavouriteState {
  final FavouriteModel favourite;

  AddFavouritSuccess({required this.favourite});
}

final class AddFavouritFailure extends AddFavouriteState {
  final String errorMessage;
  AddFavouritFailure({required this.errorMessage});
}
