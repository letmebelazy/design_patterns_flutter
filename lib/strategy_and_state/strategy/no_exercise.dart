import 'package:design_patterns_flutter/strategy_and_state/strategy/exercise.dart';

class NoExercise implements Exercise {
  @override
  int getBurnedCalories() {
    return 0;
  }

  @override
  String exercise() {
    return '숨쉬기 운동..';
  }
}
