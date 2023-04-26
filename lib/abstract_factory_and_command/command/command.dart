import 'package:flutter/material.dart';

import 'package:design_patterns_flutter/abstract_factory_and_command/abstract_factory/greeting.dart';

// 커맨드 인터페이스
abstract class Command {
  Text execute();
}

// 파란 폰트 커맨드
// 각각의 커맨드는 Greeting을 리시버로 가지고 있음
class BlueCommand implements Command {
  final Greeting greeting;
  final Color color = Colors.blue;

  BlueCommand({required this.greeting});

  @override
  Text execute() {
    return Text(
      greeting.say(),
      style: TextStyle(color: color, fontSize: 20.0),
    );
  }
}

// 빨간 폰트 커맨드
class RedCommand implements Command {
  final Greeting greeting;
  final Color color = Colors.red;

  RedCommand({required this.greeting});

  @override
  Text execute() {
    return Text(
      greeting.say(),
      style: TextStyle(color: color, fontSize: 20.0),
    );
  }
}

// 초록 폰트 커맨드
class GreenCommand implements Command {
  final Greeting greeting;
  final Color color = Colors.green;

  GreenCommand({required this.greeting});

  @override
  Text execute() {
    return Text(
      greeting.say(),
      style: TextStyle(color: color, fontSize: 20.0),
    );
  }
}
