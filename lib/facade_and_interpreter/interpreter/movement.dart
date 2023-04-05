import 'dart:ui';

import 'package:design_patterns_flutter/facade_and_interpreter/interpreter/motion.dart';

// 주어진 방향에 따라 한 칸 이동하는 구체클래스
// Non-terminal Expression
class Movement implements Motion {
  final Motion rotation;
  final Offset currentOffset;

  Movement({
    required this.rotation,
    required this.currentOffset,
  });

  @override
  Offset interpret() {
    // 현재 위치와 바로 직전 방향을 활용해서 옮겨질 위치를 나타냄
    return currentOffset + rotation.interpret();
  }
}
