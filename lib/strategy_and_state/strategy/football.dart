import 'package:design_patterns_flutter/strategy_and_state/strategy/exercise.dart';
import 'package:design_patterns_flutter/strategy_and_state/strategy/swimming.dart';

class Football implements Exercise {
  @override
  String exercise() {
    return '미래의 손흥민을 위해';
  }

  @override
  int getBurnedCalories() {
    return 800;
  }
}
