import 'package:design_patterns_flutter/strategy_and_state/person.dart';

abstract class DietState {
  // 두 가지의 공통 메서드를 들고 있음
  // 전략패턴보다는 조금 복잡하지만
  // 두 패턴 모두 인터페이스(혹은 추상클래스)를 활용한 객체의 다형성에 기초하고 있다는 점은 동일
  // 사실상 디자인패턴의 대부분이 객체지향 언어의 성질을 이용했다는 점에서 비슷한 모습이지만
  // 어디서 어떻게 사용하는가 문맥에 따라 달라짐
  void changeState();
  String getCurrentState();
}
