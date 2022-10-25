import 'dart:async';

import 'package:mvi_architecture/model/counter_model.dart';

class HomeIntent {
  HomeIntent({required this.homeModel});
  final CounterModel homeModel;

  final StreamController<StateCounter> _controllerStatus =
      StreamController<StateCounter>();
  Stream<StateCounter> get streamStatus => _controllerStatus.stream;

  Future<void> init() async {
    _controllerStatus.add(CalculatedCounter());
  }

  incrementNumber() async {
    _controllerStatus.add(IncrementingCounter());
    await Future.delayed(const Duration(seconds: 1));
    homeModel.setNumber = 1;
    _controllerStatus.add(CalculatedCounter());
  }

  void decrementNumber() async {
    _controllerStatus.add(DecrementingCounter());
    await Future.delayed(const Duration(seconds: 1));
    homeModel.setNumber = -1;
    _controllerStatus.add(CalculatedCounter());
  }
}
