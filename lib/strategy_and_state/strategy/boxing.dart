import 'package:design_patterns_flutter/strategy_and_state/strategy/exercise.dart';

class Boxing implements Exercise {
  @override
  int getBurnedCalories() {
    return 735;
  }

  @override
  String exercise() {
    return '원투원투! 복싱 중';
  }
}