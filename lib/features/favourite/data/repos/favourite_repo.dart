import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../model/favourite_model/favourite_model.dart';

abstract class FavouriteRepo {
  Future<Either<Failure, FavouriteModel>> addToFavourite();
}
