abstract class AddFavouriteState {}

final class AddFavouritInitial extends AddFavouriteState {}

//final class FavouritLoading extends AddFavouriteState {}

final class AddFavouritSuccess extends AddFavouriteState {
}

final class AddFavouritFailure extends AddFavouriteState {
  final String errorMessage;
  AddFavouritFailure({required this.errorMessage});
}