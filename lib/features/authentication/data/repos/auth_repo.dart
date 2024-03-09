import 'package:dartz/dartz.dart';
import 'package:ekhtarly_app/core/errors/failure.dart';
import 'package:ekhtarly_app/features/authentication/data/models/auth_model/auth_model.dart';

abstract class AuthRepo {
Future<Either<Failure,List<AuthModel>>> registerUser({required String name,required String email,required String password});
Future<Either<Failure,List<AuthModel>>>  loginUser({required String email,required String password});
}