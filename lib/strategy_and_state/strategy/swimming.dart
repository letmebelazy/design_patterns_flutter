import 'package:design_patterns_flutter/strategy_and_state/strategy/exercise.dart';

class Swimming implements Exercise {
  @override
  int getBurnedCalories() {
    return 662;
  }

  @override
  String exercise() {
    return '음~~파 음~~파 헤엄쳐요';
  }
}
