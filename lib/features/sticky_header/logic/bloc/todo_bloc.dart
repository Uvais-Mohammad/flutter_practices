import 'package:aqary_test/features/sticky_header/models/todo_response_model.dart';
import 'package:aqary_test/features/sticky_header/repository/i_todo_repository.dart';
import 'package:aqary_test/shared/enums/loading_status.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  late final ITodoRepository _todoRepository;

  TodoBloc(ITodoRepository todoRepository)
      : _todoRepository = todoRepository,
        super(const TodoState()) {
    on<FetchTodoEvent>(_onFetchTodoEvent);
    on<LoadMoreTodoEvent>(_onLoadMoreTodoEvent);
  }

  Future<void> _onFetchTodoEvent(
      FetchTodoEvent event, Emitter<TodoState> emit) async {
    emit(
        state.copyWith(loadingStatus: LoadingStatus.loading, errorMessage: ''));
    try {
      final skip = state.todoResponse?.skip;
      final nextState = await _getNextState(
        skip: skip ?? 0,
      );
      emit(nextState);
    } catch (e) {
      emit(state.copyWith(
          loadingStatus: LoadingStatus.error, errorMessage: e.toString()));
    }
  }

  Future<void> _onLoadMoreTodoEvent(
      LoadMoreTodoEvent event, Emitter<TodoState> emit) async {
    emit(state.copyWith(
        loadingMoreStatus: LoadingStatus.loading, errorMessage: ''));
    try {
      final skip = state.todoResponse?.skip;
      final nextState = await _getNextState(
        skip: (skip ?? 0) + 10,
      );
      emit(
        nextState.copyWith(
          loadingMoreStatus: LoadingStatus.success,
          todoResponse: TodoResponse(
            skip: nextState.todoResponse?.skip,
            limit: nextState.todoResponse?.limit,
            total: nextState.todoResponse?.total,
            todos: [
              ...state.todoResponse?.todos ?? [],
              ...nextState.todoResponse?.todos ?? []
            ],
          ),
        ),
      );
    } catch (e) {
      emit(state.copyWith(
          loadingMoreStatus: LoadingStatus.error, errorMessage: e.toString()));
    }
  }

  Future<TodoState> _getNextState({
    required int skip,
  }) async {
    const limit = 10;
    final response = await _todoRepository.getTodos(skip: skip, limit: limit);
    return state.copyWith(
        loadingStatus: LoadingStatus.success, todoResponse: response);
  }
}
