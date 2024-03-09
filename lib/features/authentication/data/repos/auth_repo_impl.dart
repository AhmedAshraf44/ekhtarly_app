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
  @override
  Future<Either<Failure, List<AuthModel>>> registerUser(
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
      
  print('true data :$data');
  return right(data[0]);
} catch (e) {
    print('false data');
      if (e is DioException) {
        print('fffffffffffffffffff');
        return left(ServerFailure.formDioError(e));
      }
      print('tttttttttttttttt');
      return left(ServerFailure(e.toString()));
      
    }
  }

  Future<Either<Failure, List<AuthModel>>> loginUser(
      {required String email, required String password}) {
    throw UnimplementedError();
  }
}
