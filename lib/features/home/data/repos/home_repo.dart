import 'package:dartz/dartz.dart';
import 'package:ekhtarly_app/core/errors/failure.dart';
import 'package:ekhtarly_app/features/home/data/model/newest_laptop/newest_laptop_model.dart';
import 'package:ekhtarly_app/features/home/data/model/profile.dart';

abstract class HomeRepo {
  Future<Either<Failure, NewestLaptopModel>> getNewestLaptops();
  Future<Either<Failure, Profile>> getprofile();
  Future<Either<Failure, Map<String,dynamic>>> changePassword(Map<String,String> body);
}
