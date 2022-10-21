import 'package:counter_mvi/models/counter/counter_model.dart';
import 'package:counter_mvi/mvi_core.dart';

class CounterPartialState implements MviPartialState {}

class CounterCalculating extends CounterPartialState {
  final String msg;

  CounterCalculating({required this.msg});
}

class CounterError extends CounterPartialState {
  final String errorMsg;

  CounterError({required this.errorMsg});
}

class CounterCalculated extends CounterPartialState {
  final CounterModel counter;

  CounterCalculated({required this.counter});
}
