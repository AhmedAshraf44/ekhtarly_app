import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ekhtarly_app/core/errors/failure.dart';
import 'package:ekhtarly_app/features/favourite/data/repos/favourite_repo.dart';
import '../../../../core/utils/api_service.dart';
import '../model/add_favotite_model.dart';
import '../model/delete_favorite_model.dart';
import '../model/diaplay_favorite_model/diaplay_favorite_model.dart';

class FavouriteRepoImpl implements FavouriteRepo {
  final ApiService apiService;

  FavouriteRepoImpl(this.apiService);
  @override
  Future<Either<Failure, DisplayFavoriteModel>> displayFavourite() async {
    try {
      var data = await apiService.get(
        endpoint: 'api/favorite',
      );
      //log(data.toString());
      return right(DisplayFavoriteModel.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.formDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, AddFavotiteModel>> addToFavourite({required String id}) async{
    try {
      var data = await apiService.patch(
        endpoint: 'api/favorite/$id',
      );
      log(data.toString());
      return right(AddFavotiteModel.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.formDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, DeleteFavoriteModel>> deleteToFavourite({required String id})async {
       try {
      var data = await apiService.delete(
        endpoint: 'api/favorite/$id',
      );
      log(data.toString());
      return right(DeleteFavoriteModel.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.formDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
