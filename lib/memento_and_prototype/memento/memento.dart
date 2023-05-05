import 'package:design_patterns_flutter/memento_and_prototype/prototype/exercise.dart';

abstract class Memento {
  Exercise getState();
}

class MementoImpl extends Memento {
  late final Exercise _state;

  MementoImpl(Exercise exercise) {
    _state = exercise.clone() as Exercise;
  }

  @override
  Exercise getState() {
    return _state;
  }
}
