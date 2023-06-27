import 'package:flutter/material.dart';

import 'package:design_patterns_flutter/flyweight_and_chain_of_responsibility/flyweight/lawn.dart';

class LawnWithNoCommit implements Lawn {
  @override
  Color getColor() {
    return Colors.transparent;
  }

  @override
  int commitCount = 0;
}
