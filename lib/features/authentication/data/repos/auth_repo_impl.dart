import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ekhtarly_app/core/errors/failure.dart';
import 'package:ekhtarly_app/core/utils/api_service.dart';
import 'package:ekhtarly_app/features/authentication/data/models/auth_model/auth_model.dart';
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

     // log('true data :$data');
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.formDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthModel>> loginUser(
      {required String email, required String password}) async {
    try {
      var data = await apiService.post(
        endpoint: 'login',
        data: {
          "email": email,
          "password": password,
        },
      );
     // log('$data');
      return right(AuthModel.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.formDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, dynamic>> otpVerifyEmail(
      {required String email, required String code}) async {
    try {
      var data = await apiService.patch(endpoint: 'verify', data: {
        'email': email,
        'code': code,
      });
      //log('$data');
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.formDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, dynamic>> resendVerifyCode(
      {required String email}) async {
    try {
      var data = await apiService.post(
        endpoint: 'sendVC',
        data: {
          'email': email,
        },
      );
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.formDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, dynamic>> forgotPasswordSendCode(
      {required String email}) async {
    try {
      var data =
          await apiService.post(endpoint: 'forgotPassword-sendCode', data: {
        "email": email,
      });
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.formDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, dynamic>> forgotPasswordSubmitCode({
    required String email,
    required String code,
  }) async {
    try {
      var data =
          await apiService.post(endpoint: 'forgotPassword-submitCode', data: {
        'email': email,
        'code': code,
      });
    //  log('$data');
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.formDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, dynamic>> forgotPasswordChange(
      {required String email,
      required String code,
      required String password}) async {
    try {
      var data =
          await apiService.patch(endpoint: 'forgotPassword-change', data: {
        'email': email,
        'code': code,
        'password': password,
      });
     // log('$data');
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.formDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
