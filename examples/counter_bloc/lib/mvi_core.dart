import 'models/counter/counter_model.dart';

class MviPartialState {}

abstract class Intent {
  CounterModel caculateNewCounter(CounterModel oldCounter);
}
