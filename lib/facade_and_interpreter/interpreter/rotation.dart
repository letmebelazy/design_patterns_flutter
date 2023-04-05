import 'dart:ui';

import 'package:design_patterns_flutter/facade_and_interpreter/interpreter/motion.dart';

// 방향을 나타내는 구체클래스
// Terminal Expression
class LeftRotation implements Motion {
  final Offset offset = Offset(-1, 0);

  @override
  Offset interpret() {
    // Terminal Expression은 다른 로직 없이 가지고 있는 값을 그대로 리턴한다
    return offset;
  }
}

class RightRotation implements Motion {
  final Offset offset = Offset(1, 0);

  @override
  Offset interpret() {
    return offset;
  }
}

class TopRotation implements Motion {
  final Offset offset = Offset(0, 1);

  @override
  Offset interpret() {
    return offset;
  }
}

class BottomRotation implements Motion {
  final Offset offset = Offset(0, -1);

  @override
  Offset interpret() {
    return offset;
  }
}
