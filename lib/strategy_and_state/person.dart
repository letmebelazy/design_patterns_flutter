import 'package:design_patterns_flutter/strategy_and_state/state/diet_done.dart';
import 'package:design_patterns_flutter/strategy_and_state/state/diet_state.dart';
import 'package:design_patterns_flutter/strategy_and_state/state/need_more_diet.dart';
import 'package:design_patterns_flutter/strategy_and_state/strategy/exercise.dart';
import 'package:design_patterns_flutter/strategy_and_state/strategy/no_exercise.dart';

// 클라이언트에 해당하는 살을 빼려는 사람
class Person {
  // 다이어트가 필요한 상태, 끝난 상태 두 가지를 다 들고 있음
  late DietState needMore;
  late DietState done;

  // 현재 더 빼야하는 칼로리
  int leftCalorie;

  // Exercise는 운동이라는 전략객체의 인터페이스로 기본값으로 운동하지 않음을 뜻하는 객체가 들어감
  // 객체 생성은 클래스 내부에서 하지 않는 것이 좋다는 게 일반적인 상식이나
  // 시작값이나 대다수의 비율을 차지하는 값은 넣어줘도 무방함
  Exercise exercise = NoExercise();

  // 위의 두 가지는 해당 사람 객체가 가질 수 있는 상태에 해당하며
  // 이 객체는 현재 상태 역할
  late DietState currentState;

  // 다트의 경우 null safety가 엄격하므로 우선 late로 선언한 후
  // 생성 시 초기화해줌
  Person({required this.leftCalorie}) {
    needMore = NeedMoreDiet(person: this);
    done = DietDone(person: this);
    currentState = needMore;
  }

  // 현재 나의 상태를 변경
  void changeState(DietState state) {
    this.currentState = state;
  }

  // 운동(전략)을 변경
  void chooseExercise(Exercise exercise) {
    this.exercise = exercise;
  }
}
