import 'package:flutter/material.dart';

import 'package:design_patterns_flutter/abstract_factory_and_command/abstract_factory/greeting.dart';

abstract class Command {
  Text execute();
}

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
