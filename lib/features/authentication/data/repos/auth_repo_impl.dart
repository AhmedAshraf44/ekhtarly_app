import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ekhtarly_app/core/errors/failure.dart';
import 'package:ekhtarly_app/core/utils/api_service.dart';
import 'package:ekhtarly_app/features/authentication/data/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService apiService;

  AuthRepoImpl(this.apiService);
  @override
  Future<Either<Failure, dynamic>> registerUser(
      {required String name,
      required String email,
      required String password}) async {
    try {
      var data = await apiService.post(
        endpoint: 'signup',
        data: {
          "name": name,
          "email": email,
          "password": password,
        },
      );

      log('true data :$data');
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.formDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, dynamic>> loginUser(
      {required String email, required String password}) async {
    try {
      var data = await apiService.post(
        endpoint: 'login',
        data: {
          "email": email,
          "password": password,
        },
      );
      log('true data :$data');
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.formDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
