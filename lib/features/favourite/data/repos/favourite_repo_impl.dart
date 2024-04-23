import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ekhtarly_app/core/errors/failure.dart';
import 'package:ekhtarly_app/features/favourite/data/model/favourite_model/favourite_model.dart';
import 'package:ekhtarly_app/features/favourite/data/repos/favourite_repo.dart';

import '../../../../core/utils/api_service.dart';

class FavouriteRepoImpl implements FavouriteRepo {
  final ApiService apiService;

  FavouriteRepoImpl(this.apiService);
  @override
  Future<Either<Failure, FavouriteModel>> getFavourite() async {
    try {
      var data = await apiService.get(
        endpoint: 'api/favorite',
      );
      //log(data.toString());
      return right(FavouriteModel.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.formDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, dynamic>> addToFavourite({required int id}) async{
    try {
      var data = await apiService.patch(
        endpoint: 'api/favorite/$id',
      );
      //log(data.toString());
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.formDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
