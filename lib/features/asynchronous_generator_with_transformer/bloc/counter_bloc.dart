import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<CounterEvent>(
      (event, emit) => switch (event) {
        CounterIncrement() => onIncrement(event, emit),
        CounterDecrement() => onDecrement(event, emit),
      },
      transformer: sequential(),
    );
  }
  Future<void> onIncrement(
    CounterIncrement event,
    Emitter<CounterState> emit,
  ) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    emit(state.copyWith(value: state.value + 1));
  }

  Future<void> onDecrement(
    CounterDecrement event,
    Emitter<CounterState> emit,
  ) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    emit(state.copyWith(value: state.value - 1));
  }
}
