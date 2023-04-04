import 'dart:ui';

import 'package:design_patterns_flutter/facade_and_interpreter/interpreter/action.dart';

class LeftRotation implements Motion {
  final Offset offset = Offset(-1, 0);

  @override
  Offset interpret() {
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
