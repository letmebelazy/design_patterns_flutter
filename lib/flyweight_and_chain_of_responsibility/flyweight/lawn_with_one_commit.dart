import 'package:flutter/material.dart';

import 'package:design_patterns_flutter/flyweight_and_chain_of_responsibility/flyweight/lawn.dart';

class LawnWithOneCommit implements Lawn {
  @override
  Color getColor() {
    return Color(0xFF0E442A);
  }

  @override
  int commitCount = 1;
}
