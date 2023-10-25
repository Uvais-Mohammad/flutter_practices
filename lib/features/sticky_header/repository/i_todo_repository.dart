import 'package:aqary_test/features/sticky_header/models/todo_response_model.dart';

abstract interface class ITodoRepository {
  Future<TodoResponse> getTodos({required int skip, required int limit});
}
