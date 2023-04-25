abstract class Greeting {
  String say();
}

abstract class MeetingGreeting implements Greeting {
  @override
  String say();
}

abstract class FarewellGreeting implements Greeting {
  @override
  String say();
}

class KoreanMeetingGreeting implements MeetingGreeting {
  @override
  String say() {
    return '안녕';
  }
}

class EnglishMeetingGreeting implements MeetingGreeting {
  @override
  String say() {
    return 'Hi';
  }
}

class JapaneseMeetingGreeting implements MeetingGreeting {
  @override
  String say() {
    return 'こんにちは';
  }
}

class KoreanFarewellGreeting implements FarewellGreeting {
  @override
  String say() {
    return '잘 가';
  }
}

class EnglishFarewellGreeting implements FarewellGreeting {
  @override
  String say() {
    return 'Good bye';
  }
}

class JapaneseFarewellGreeting implements FarewellGreeting {
  @override
  String say() {
    return 'じゃね';
  }
}
