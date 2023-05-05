import 'dart:math';

import 'package:design_patterns_flutter/memento_and_prototype/prototype/exercise.dart';
import 'package:design_patterns_flutter/memento_and_prototype/memento/memento.dart';
import 'package:design_patterns_flutter/memento_and_prototype/memento/originator.dart';

abstract class Command {
  void execute();
  void undo();
}

class ChangeTargetCommand implements Command {
  final Originator originator;
  late final Memento _backup;

  ChangeTargetCommand(this.originator) {
    _backup = originator.createMemento();
  }

  @override
  void execute() {
    final exercise = originator.state;
    final currentTargetIndex = exercise.target.index;
    final random = Random();
    bool flag = false;

    while (!flag) {
      final randIndex = random.nextInt(5);
      if (currentTargetIndex != randIndex) {
        exercise.target = TargetMuscle.values[randIndex];
        flag = true;
      }
    }
  }

  @override
  void undo() {
    originator.restore(_backup);
  }
}

class ChangeWeightCommand implements Command {
  final Originator originator;
  late final Memento _backup;

  ChangeWeightCommand(this.originator) {
    _backup = originator.createMemento();
  }

  @override
  void execute() {
    final exercise = originator.state;
    final currentWeight = exercise.weight;
    final random = Random();
    bool flag = false;

    while (!flag) {
      final randWeight = random.nextInt(150) + 1;
      if (currentWeight != randWeight) {
        exercise.weight = randWeight;
        flag = true;
      }
    }
  }

  @override
  void undo() {
    originator.restore(_backup);
  }
}
