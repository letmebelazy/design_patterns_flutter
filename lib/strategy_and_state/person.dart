import 'package:design_patterns_flutter/strategy_and_state/state/diet_done.dart';
import 'package:design_patterns_flutter/strategy_and_state/state/diet_state.dart';
import 'package:design_patterns_flutter/strategy_and_state/state/need_more_diet.dart';
import 'package:design_patterns_flutter/strategy_and_state/strategy/exercise.dart';
import 'package:design_patterns_flutter/strategy_and_state/strategy/no_exercise.dart';

class Person {
  late DietState needMore;
  late DietState done;
  int leftCalorie;
  Exercise exercise = NoExercise();
  late DietState currentState;

  Person({required this.leftCalorie}) {
    needMore = NeedMoreDiet(person: this);
    done = DietDone(person: this);
    currentState = needMore;
  }

  void changeState(DietState state) {
    this.currentState = state;
  }

  void chooseExercise(Exercise exercise) {
    this.exercise = exercise;
  }
}
