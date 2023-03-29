import 'package:design_patterns_flutter/strategy_and_state/person.dart';
import 'package:design_patterns_flutter/strategy_and_state/state/diet_done.dart';
import 'package:design_patterns_flutter/strategy_and_state/state/diet_state.dart';

class NeedMoreDiet implements DietState {
  Person person;

  NeedMoreDiet({required this.person});

  @override
  String getCurrentState() {
    return '운동 더 하자';
  }

  @override
  void changeState() {
    person.changeState(
      DietDone(person: person),
    );
  }
}
