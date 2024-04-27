import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../model/favourite_model/favourite_model.dart';

abstract class FavouriteRepo {
  Future<Either<Failure, FavouriteModel>> getFavourite();
  Future<Either<Failure, dynamic>> addToFavourite({required String id});
}
