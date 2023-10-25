import 'dart:convert';

import 'package:aqary_test/features/sticky_header/models/todo_response_model.dart';
import 'package:aqary_test/features/sticky_header/repository/i_todo_repository.dart';
import 'package:aqary_test/shared/api/endpoints.dart';
import 'package:aqary_test/shared/services/rest_client/i_rest_client.dart';
import 'package:aqary_test/shared/services/service_locator.dart';

class TodoRepository implements ITodoRepository {

  final IRestClient restClient = serviceLocator<IRestClient>();

  @override
  Future<TodoResponse> getTodos({required int skip, required int limit}) async {
    const url = EndPoint.todos;
    final response = await restClient.get('$url?limit=$limit&skip=$skip');
    return TodoResponse.fromJson(json.decode(response.body));
  }
  
}
