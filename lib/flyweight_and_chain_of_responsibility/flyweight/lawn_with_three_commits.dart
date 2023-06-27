import 'package:flutter/material.dart';

import 'package:design_patterns_flutter/flyweight_and_chain_of_responsibility/flyweight/lawn.dart';

class LawnWithThreeCommits implements Lawn {
  @override
  Color getColor() {
    return Color(0xFF26A641);
  }

  @override
  int commitCount = 3;
}
