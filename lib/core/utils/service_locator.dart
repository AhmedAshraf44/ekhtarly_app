import 'package:dio/dio.dart';
import 'package:ekhtarly_app/core/utils/api_service.dart';
import 'package:ekhtarly_app/features/favourite/data/repos/favourite_repo_impl.dart';
import 'package:ekhtarly_app/features/home/data/repos/home_repo_impl.dart';
import 'package:ekhtarly_app/features/search/data/repo/search_repositert_implementation.dart';
import 'package:get_it/get_it.dart';

import '../../features/authentication/data/repos/auth_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
  getIt.registerSingleton<FavouriteRepoImpl>(
    FavouriteRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
  getIt.registerSingleton<SearchImpl>(
    SearchImpl(
      apiService: getIt.get<ApiService>(),
    ),
  );
}
