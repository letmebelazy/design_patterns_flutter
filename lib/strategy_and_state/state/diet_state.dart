import 'package:design_patterns_flutter/strategy_and_state/person.dart';

abstract class DietState {
  void changeState();
  String getCurrentState();
}
