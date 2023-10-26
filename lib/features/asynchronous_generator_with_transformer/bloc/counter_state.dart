part of 'counter_bloc.dart';

 class CounterState {
  final int value;
  const CounterState({this.value = 0});

  CounterState copyWith({int? value}) {
    return CounterState(value: value ?? this.value);
  }
 }

  