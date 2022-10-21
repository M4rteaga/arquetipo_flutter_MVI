import 'dart:async';

import 'package:counter_mvi/models/counter/counter_model.dart';
import 'package:counter_mvi/models/counter/counter_states.dart';
import 'package:counter_mvi/bloc/intents.dart';

class CounterBloc {
  final StreamController<CounterPartialState> counterController =
      StreamController();
  //initial model
  CounterModel counter = const CounterModel(number: 0);

  late CounterPartialState lastState;

  CounterBloc() {
    //initialize state
    lastState = CounterCalculated(counter: counter);
    counterController.add(lastState);
  }

  void interactWithIntent(CounterIntent intent) async {
    if (intent.runtimeType == CounterSumIntent) {
      sum(intent);
    }
    if (intent.runtimeType == CounterDecreseIntent) {
      substract(intent);
    }
  }

  Future<void> substract(CounterIntent intent) async {
    final s = Stream.fromIterable([
      Stream.value(
          CounterCalculating(msg: 'substracting one to ${counter.number}')),
      Stream.fromFuture(intent.newCalculatedState(counter))
    ]);

    s.listen((e) => e.listen((event) => changeState(event)));
  }

  Future<void> sum(CounterIntent intent) async {
    final s = Stream.fromIterable([
      Stream.value(CounterCalculating(msg: 'adding one to ${counter.number}')),
      Stream.fromFuture(intent.newCalculatedState(counter))
    ]);

    s.listen((e) => e.listen((event) => changeState(event)));
  }

  void changeState(CounterPartialState counterState) {
    if (counterState.runtimeType == CounterCalculated) {
      counter = (counterState as CounterCalculated).counter;
      counterController.add(counterState);
    } else if (counterState.runtimeType == CounterCalculating) {
      counterController.add(counterState);
    }
  }
}

final counterBloc = CounterBloc();
