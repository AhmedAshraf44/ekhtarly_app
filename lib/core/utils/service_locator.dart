
import 'package:dio/dio.dart';
import 'package:ekhtarly_app/core/utils/api_service.dart';
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
 
 }