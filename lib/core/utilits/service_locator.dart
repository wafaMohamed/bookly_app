import 'package:bookly_app/features/search/data/repo/search_repo_implemntation.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/repos/home_repo_implemntation.dart';
import 'api_service.dart';

/// Dependency injection -> to make singleton pattern
final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
  getIt.registerSingleton<SearchRepoImplementation>(
      SearchRepoImplementation(getIt.get<ApiService>()));
}
