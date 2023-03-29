import 'package:design_patterns_flutter/strategy_and_state/strategy/exercise.dart';

class Running implements Exercise {
  @override
  int getBurnedCalories() {
    return 515;
  }

  @override
  String exercise() {
    return '후하후하 열심히 뛰는 중';
  }
}
