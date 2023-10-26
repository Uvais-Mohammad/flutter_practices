part of 'todo_bloc.dart';

class TodoState extends Equatable {
  const TodoState({
    this.todoResponse,
    this.loadingStatus = LoadingStatus.idle,
    this.loadingMoreStatus = LoadingStatus.idle,
    this.errorMessage,
  });

  final TodoResponse? todoResponse;
  final LoadingStatus loadingStatus;
  final LoadingStatus loadingMoreStatus;
  final String? errorMessage;

  @override
  List<Object?> get props => [
        todoResponse,
        loadingStatus,
        loadingMoreStatus,
        errorMessage,
      ];

  TodoState copyWith({
    TodoResponse? todoResponse,
    LoadingStatus? loadingStatus,
    LoadingStatus? loadingMoreStatus,
    String? errorMessage,
  }) {
    return TodoState(
      todoResponse: todoResponse ?? this.todoResponse,
      loadingStatus: loadingStatus ?? this.loadingStatus,
      loadingMoreStatus: loadingMoreStatus ?? this.loadingMoreStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
