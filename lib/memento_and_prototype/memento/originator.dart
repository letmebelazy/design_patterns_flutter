import 'package:design_patterns_flutter/memento_and_prototype/prototype/exercise.dart';
import 'package:design_patterns_flutter/memento_and_prototype/memento/memento.dart';

class Originator {
  late Exercise state;

  Originator() {
    state = Exercise.init();
  }

  Memento createMemento() {
    return MementoImpl(state);
  }

  void restore(Memento memento) {
    state = memento.getState();
  }
}
