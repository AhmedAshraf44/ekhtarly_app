import 'package:dartz/dartz.dart';
import 'package:ekhtarly_app/core/errors/failure.dart';
abstract class AuthRepo {
Future<Either<Failure,dynamic>> registerUser({required String name,required String email,required String password});
Future<Either<Failure,dynamic>>  loginUser({required String email,required String password});
Future<Either<Failure,dynamic>>  otpVerifyEmail({required String email,required String code});
Future<Either<Failure,dynamic>>  resendVerifyCode({required String email});
Future<Either<Failure,dynamic>>  forgotPasswordSendCode({required String email});

}
//List<AuthModel>