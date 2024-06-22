import 'package:dartz/dartz.dart';
import 'package:ekhtarly_app/core/errors/failure.dart';
import 'package:ekhtarly_app/features/search/data/model/program_model.dart';
import 'package:ekhtarly_app/core/models/newest_laptops_details_model/laptops.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<ProgramModel>>> getProgram();
  Future<Either<Failure, List<Laptops>>> recommendedLaptops(
      List<String> programs, int budget);
}
