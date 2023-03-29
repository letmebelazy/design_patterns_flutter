import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../strategy/exercise.dart';

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
