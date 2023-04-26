import 'package:design_patterns_flutter/abstract_factory_and_command/abstract_factory/greeting.dart';

// 추상 팩토리
abstract class GreetingFactory {
  MeetingGreeting createMeetingGreeting();
  FarewellGreeting createFarewellGreeting();
}

// 구체 팩토리 1
class KoreanGreetingFactory implements GreetingFactory {
  @override
  FarewellGreeting createFarewellGreeting() {
    return KoreanFarewellGreeting();
  }

  @override
  MeetingGreeting createMeetingGreeting() {
    return KoreanMeetingGreeting();
  }
}

// 구체 팩토리 2
class EnglishGreetingFactory implements GreetingFactory {
  @override
  FarewellGreeting createFarewellGreeting() {
    return EnglishFarewellGreeting();
  }

  @override
  MeetingGreeting createMeetingGreeting() {
    return EnglishMeetingGreeting();
  }
}

// 구체 팩토리 3
class JapaneseGreetingFactory implements GreetingFactory {
  @override
  FarewellGreeting createFarewellGreeting() {
    return JapaneseFarewellGreeting();
  }

  @override
  MeetingGreeting createMeetingGreeting() {
    return JapaneseMeetingGreeting();
  }
}
