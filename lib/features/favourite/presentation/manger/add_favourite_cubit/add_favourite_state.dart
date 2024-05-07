import '../../../data/model/add_favotite_model.dart';
import '../../../data/model/delete_favorite_model.dart';
import '../../../data/model/favourite_model/favourite_model.dart';

abstract class FavouriteState {
  const FavouriteState();
}

final class FavouriteInitial extends FavouriteState {}

//final class FavouritLoading extends AddFavouriteState {}

final class DisplayFavourite extends FavouriteState {
  final FavouriteModel favoriteList;
  const DisplayFavourite({required this.favoriteList});
}

final class AddFavourite extends FavouriteState {
  final AddFavotiteModel addFavotiteModel;
 const AddFavourite({required this.addFavotiteModel});
}

final class DeleteFavourite extends FavouriteState {
  final DeleteFavoriteModel deleteFavoriteModel;
 const DeleteFavourite({required this.deleteFavoriteModel});
}

final class FavouriteFailure extends FavouriteState {
  final String errorMessage;
 const  FavouriteFailure({required this.errorMessage});
}