import 'package:dartz/dartz.dart';
import 'package:ekhtarly_app/core/errors/failure.dart';
import 'package:ekhtarly_app/features/search/data/model/program_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<ProgramModel>>> getProgram();
}
