import 'package:counter_mvi/models/counter/counter_model.dart';
import 'package:counter_mvi/models/counter/counter_states.dart';
import 'package:counter_mvi/mvi_core.dart';

class CounterIntent implements Intent {
  @override
  CounterModel caculateNewCounter(CounterModel oldCounter) {
    throw UnimplementedError();
  }

  Future<CounterCalculated> newCalculatedState(CounterModel counter) async {
    final newCounter = caculateNewCounter(counter);
    return await Future.delayed(const Duration(seconds: 1), () {
      return CounterCalculated(counter: newCounter);
    });
  }
}

class CounterSumIntent extends CounterIntent {
  CounterSumIntent() : super();
  @override
  CounterModel caculateNewCounter(CounterModel oldCounter) {
    return CounterModel(number: oldCounter.number + 1);
  }
}

class CounterDecreseIntent extends CounterIntent {
  CounterDecreseIntent() : super();
  @override
  CounterModel caculateNewCounter(CounterModel oldCounter) {
    return CounterModel(number: oldCounter.number - 1);
  }
}
