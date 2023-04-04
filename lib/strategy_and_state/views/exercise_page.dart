import 'dart:async';

import 'package:design_patterns_flutter/strategy_and_state/strategy/exercise.dart';
import 'package:flutter/material.dart';

class ExercisePage extends StatelessWidget {
  final Exercise exercise;
  const ExercisePage({
    super.key,
    required this.exercise,
  });

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pop(
        exercise.getBurnedCalories(),
      );
    });

    return Scaffold(
      body: Center(
        child: Text(
          exercise.exercise(),
        ),
      ),
    );
  }
}
