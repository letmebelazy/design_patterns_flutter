// 생산품 인터페이스 루트
abstract class Greeting {
  String say();
}

// 생산품 인터페이스 1
abstract class MeetingGreeting implements Greeting {
  @override
  String say();
}

// 생산품 인터페이스 2
abstract class FarewellGreeting implements Greeting {
  @override
  String say();
}

// 구체 생산품 1
class KoreanMeetingGreeting implements MeetingGreeting {
  @override
  String say() {
    return '안녕';
  }
}

// 구체 생산품 2
class EnglishMeetingGreeting implements MeetingGreeting {
  @override
  String say() {
    return 'Hi';
  }
}

// 구체 생산품 3
class JapaneseMeetingGreeting implements MeetingGreeting {
  @override
  String say() {
    return 'こんにちは';
  }
}

// 구체 생산품 4
class KoreanFarewellGreeting implements FarewellGreeting {
  @override
  String say() {
    return '잘 가';
  }
}

// 구체 생산품 5
class EnglishFarewellGreeting implements FarewellGreeting {
  @override
  String say() {
    return 'Good bye';
  }
}

// 구체 생산품 6
class JapaneseFarewellGreeting implements FarewellGreeting {
  @override
  String say() {
    return 'じゃね';
  }
}
