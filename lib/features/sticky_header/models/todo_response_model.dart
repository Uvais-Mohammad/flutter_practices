import 'dart:convert';

import 'package:equatable/equatable.dart';

TodoResponse todoResponseFromJson(String str) =>
    TodoResponse.fromJson(json.decode(str));

String todoResponseToJson(TodoResponse data) => json.encode(data.toJson());

class TodoResponse extends Equatable {
  final List<Todo>? todos;
  final int? total;
  final int? skip;
  final int? limit;

  const TodoResponse({
    this.todos,
    this.total,
    this.skip=0,
    this.limit,
  });

  factory TodoResponse.fromJson(Map<String, dynamic> json) => TodoResponse(
        todos: json["todos"] == null
            ? []
            : List<Todo>.from(json["todos"]!.map((x) => Todo.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
      );

  Map<String, dynamic> toJson() => {
        "todos": todos == null
            ? []
            : List<dynamic>.from(todos!.map((x) => x.toJson())),
        "total": total,
        "skip": skip,
        "limit": limit,
      };

  @override
  List<Object?> get props => [todos, total, skip, limit];
}

class Todo extends Equatable {
  final int? id;
  final String? todo;
  final bool? completed;
  final int? userId;

  const Todo({
    this.id,
    this.todo,
    this.completed,
    this.userId,
  });

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        id: json["id"],
        todo: json["todo"],
        completed: json["completed"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "todo": todo,
        "completed": completed,
        "userId": userId,
      };

  @override
  List<Object?> get props => [id, todo, completed, userId];
}
