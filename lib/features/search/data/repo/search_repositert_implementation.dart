import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ekhtarly_app/core/errors/failure.dart';
import 'package:ekhtarly_app/core/models/newest_laptops_details_model/laptops.dart';
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

      return Right(program);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.formDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Laptops>>> recommendedLaptops(
      List<String> programs, int budget) async {
    List<Laptops> laptops = [];
    try {
      var data = await apiService.getWithList(
        budget: budget,
        programs: programs,
        endpoint: 'api/programs/recommend?limit=10',
      );

      for (var element in data['scoredLaps']) {
        laptops.add(Laptops.fromJson(element));
      }

      return Right(laptops);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.formDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
