import 'package:design_patterns_flutter/strategy_and_state/person.dart';
import 'package:design_patterns_flutter/strategy_and_state/state/diet_state.dart';
import 'package:design_patterns_flutter/strategy_and_state/state/need_more_diet.dart';

class DietDone implements DietState {
  final Person person;

  DietDone({required this.person});

  @override
  String getCurrentState() {
    return '다이어트 끝';
  }

  @override
  void changeState() {
    person.changeState(
      NeedMoreDiet(person: person),
    );
  }
}
