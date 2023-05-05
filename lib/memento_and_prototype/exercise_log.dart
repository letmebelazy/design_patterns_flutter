import 'dart:math';

import 'package:flutter/material.dart';

import 'package:design_patterns_flutter/memento_and_prototype/memento/originator.dart';
import 'package:design_patterns_flutter/memento_and_prototype/memento/command.dart';

class ExerciseLog extends StatefulWidget {
  const ExerciseLog({super.key});

  @override
  State<ExerciseLog> createState() => _ExerciseLogState();
}

class _ExerciseLogState extends State<ExerciseLog> {
  final List<Command> commands = [];
  final Originator originator = Originator();

  void _executeCommand() {
    final randIndex = Random().nextInt(2);
    if (randIndex == 0) {
      setState(() {
        final command = ChangeTargetCommand(originator);
        command.execute();
        commands.add(command);
      });
    } else {
      setState(() {
        final command = ChangeWeightCommand(originator);
        command.execute();
        commands.add(command);
      });
    }
    print(commands.last.hashCode);
  }

  void _undo() {
    setState(() {
      if (commands.isNotEmpty) {
        final command = commands.removeLast();
        command.undo();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('운동기록일지'),
        actions: [
          IconButton(
            onPressed: _executeCommand,
            icon: Icon(Icons.play_arrow),
          ),
          IconButton(
            onPressed: _undo,
            icon: Icon(Icons.undo),
          ),
        ],
      ),
      body: Center(
        child: Text(
          '${originator.state.target.part} / ${originator.state.weight} kg',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
