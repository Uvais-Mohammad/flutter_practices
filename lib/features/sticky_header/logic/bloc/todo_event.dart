part of 'todo_bloc.dart';

sealed class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}


class FetchTodoEvent extends TodoEvent {
  const FetchTodoEvent();

  @override
  List<Object> get props => [];
}

class LoadMoreTodoEvent extends TodoEvent {
  const LoadMoreTodoEvent();

  @override
  List<Object> get props => [];
}