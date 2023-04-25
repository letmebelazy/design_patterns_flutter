import 'package:design_patterns_flutter/abstract_factory_and_command/abstract_factory/greeting.dart';

abstract class GreetingFactory {
  MeetingGreeting createMeetingGreeting();
  FarewellGreeting createFarewellGreeting();
}

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
