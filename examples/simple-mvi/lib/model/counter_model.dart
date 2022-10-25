abstract class StateCounter {
  String title = "";
}

class IncrementingCounter implements StateCounter {
  @override
  String title = "incrementing";
}

class DecrementingCounter implements StateCounter {
  @override
  String title = "decrementing";
}

class CalculatedCounter implements StateCounter {
  @override
  String title = "calculated";
}

class CounterModel {
  int _number = 0;

  int init() {
    return _number;
  }

  int get getNumber => _number;

  set setNumber(int number) {
    _number += number;
  }
}

CounterModel homeModel = CounterModel();
