import 'package:chuck_norris_facts/data/repository/data_sources/get_specific_chuck_norris_facts/get_specific_chuck_norris_facts_data_source.dart';
import 'package:chuck_norris_facts/domain/use_case/get_specific_chuck_norris_facts_use_case.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'package:chuck_norris_facts/data/network/api_network.dart';
import 'package:chuck_norris_facts/data/repository/data_sources/get_chuck_norris_facts/get_chuck_norris_facts_data_source.dart';
import 'package:chuck_norris_facts/data/repository/get_chuck_norris_facts_repository_impl.dart';
import 'package:chuck_norris_facts/domain/interface/get_chuck_norris_facts_repository.dart';
import 'package:chuck_norris_facts/domain/use_case/get_chuck_norris_facts_use_case.dart';
import 'package:chuck_norris_facts/presentation/chuck_norris_facts/chuck_norris_provider.dart';

GetIt sl = GetIt.instance;

void setupLocator(String baseUrl) {
  _setUpNetwork(baseUrl);
  _setupRepositories();
  _setupDataSources();
  _setupUseCases();
  _setupNotifier();
}

void _setUpNetwork(String baseUrl) {
  sl.registerLazySingleton(
    () => ApiService(Dio(BaseOptions(baseUrl: baseUrl))),
  );
}

void _setupDataSources() {
  sl.registerFactory(() => GetChuckNorrisFactsDataSource(sl()));
  sl.registerFactory(() => GetSpecificChuckNorrisFactsDataSource(sl()));
}

void _setupRepositories() {
  sl.registerLazySingleton<GetChuckNorrisFactsRepository>(
    () => GetChuckNorrisFactsRepositoryImplementation(sl(), sl()),
  );
}

void _setupUseCases() {
  sl.registerFactory(() => GetChuckNorrisFactsUseCase(sl()));
  sl.registerFactory(() => GetSpecificChuckNorrisFactsUseCase(sl()));
}

void _setupNotifier() {
  sl.registerFactory(() => ChuckNorrisProvider(sl(), sl()));
}
