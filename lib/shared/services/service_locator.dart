import 'package:aqary_test/features/4_sticky_header/repository/i_todo_repository.dart';
import 'package:aqary_test/features/4_sticky_header/repository/todo_repository.dart';
import 'package:aqary_test/shared/services/rest_client/i_rest_client.dart';
import 'package:aqary_test/shared/services/rest_client/rest_client.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

void setupServiceLocator() {
  serviceLocator
    ..registerLazySingleton<IRestClient>(RestClient.new)
    ..registerLazySingleton<ITodoRepository>(TodoRepository.new);
}
