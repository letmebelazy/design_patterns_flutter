import 'dart:ui';

import 'package:design_patterns_flutter/facade_and_interpreter/interpreter/action.dart';

class Movement implements Motion {
  final Motion rotation;
  final Offset currentOffset;

  Movement({
    required this.rotation,
    required this.currentOffset,
  });

  @override
  Offset interpret() {
    return currentOffset + rotation.interpret();
  }
}
