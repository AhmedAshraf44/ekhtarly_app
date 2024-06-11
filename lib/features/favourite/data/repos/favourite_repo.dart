import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../model/add_favotite_model.dart';
import '../model/delete_favorite_model.dart';
import '../model/favourite_model/favourite_model.dart';

abstract class FavouriteRepo {
  Future<Either<Failure, FavouriteModel>> displayFavourite();
  Future<Either<Failure, AddFavotiteModel>> addToFavourite({required String id});
  Future<Either<Failure, DeleteFavoriteModel>> deleteToFavourite({required String id});

}
