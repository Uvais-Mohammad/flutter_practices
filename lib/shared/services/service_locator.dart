import 'package:aqary_test/shared/services/rest_client/i_rest_client.dart';
import 'package:aqary_test/shared/services/rest_client/rest_client.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

void setupServiceLocator() {
  serviceLocator.registerLazySingleton<IRestClient>(RestClient.new);
}
