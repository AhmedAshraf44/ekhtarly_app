import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ekhtarly_app/core/errors/failure.dart';
import 'package:ekhtarly_app/core/utils/api_service.dart';
import 'package:ekhtarly_app/features/search/data/model/program_model.dart';
import 'package:ekhtarly_app/features/search/data/repo/search_repsitery.dart';

class SearchImpl extends SearchRepo {
  final ApiService apiService;

  SearchImpl({required this.apiService});

  @override
  Future<Either<Failure, List<ProgramModel>>> getProgram() async {
    List<ProgramModel> program = [];
    try {
      var data = await apiService.get(
        endpoint: 'api/programs',
      );

      for (var element in data['result']) {
        program.add(ProgramModel.fromjson(element));
      }

      log('successs');
      return Right(program);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.formDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
