import 'package:dartz/dartz.dart';
import 'package:ekhtarly_app/core/errors/failure.dart';
<<<<<<< HEAD
import 'package:ekhtarly_app/features/search/data/model/program_model.dart';
=======
import 'package:ekhtarly_app/core/models/newest_laptops_details_model/laptops.dart';
import 'package:ekhtarly_app/features/home/data/model/profile.dart';
import 'package:ekhtarly_app/features/search/data/model/program_model.dart';
abstract class SearchRepo{
Future<Either<Failure, List< ProgramModel>>> getProgram();
Future<Either<Failure, List< Laptops>>> recommendedLaptops(List<String>programs,int budget);
>>>>>>> 972a371abda74f5579881c1e7c40d5508fa3ef30

abstract class SearchRepo {
  Future<Either<Failure, List<ProgramModel>>> getProgram();
}
