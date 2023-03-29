import 'package:design_patterns_flutter/strategy_and_state/person.dart';
import 'package:design_patterns_flutter/strategy_and_state/state/diet_done.dart';
import 'package:design_patterns_flutter/strategy_and_state/strategy/boxing.dart';
import 'package:design_patterns_flutter/strategy_and_state/strategy/running.dart';
import 'package:design_patterns_flutter/strategy_and_state/strategy/swimming.dart';
import 'package:design_patterns_flutter/strategy_and_state/views/exercise_page.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final Person person;

  const DetailPage({
    super.key,
    required this.person,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List<String> exercises = ['복싱', '수영', '러닝'];
  int currentIndex = -1;
  int burnedCalories = 0;

  TextStyle normalStyle = TextStyle(
    color: Colors.grey,
    fontSize: 25.0,
    fontWeight: FontWeight.w100,
  );

  TextStyle focusedStyle = TextStyle(
    color: Colors.black,
    fontSize: 25.0,
    fontWeight: FontWeight.w900,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            widget.person.currentState is DietDone ? Colors.blue : Colors.red,
        title: Text(
          widget.person.currentState.getCurrentState(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              '칼로리 충전\n(다시 하기)',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            '운동을 선택해주세요.',
            style: TextStyle(fontSize: 20.0),
          ),
          Text(
            '현재 남은 칼로리: ${widget.person.leftCalorie}',
            style: TextStyle(fontSize: 20.0, color: Colors.pink),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                child: Text(
                  exercises[0],
                  style: currentIndex == 0 ? focusedStyle : normalStyle,
                ),
                onPressed: () {
                  setState(() {
                    currentIndex = 0;
                  });

                  widget.person.chooseExercise(
                    Boxing(),
                  );
                },
              ),
              TextButton(
                child: Text(
                  exercises[1],
                  style: currentIndex == 1 ? focusedStyle : normalStyle,
                ),
                onPressed: () {
                  setState(() {
                    currentIndex = 1;
                  });

                  widget.person.chooseExercise(
                    Swimming(),
                  );
                },
              ),
              TextButton(
                child: Text(
                  exercises[2],
                  style: currentIndex == 2 ? focusedStyle : normalStyle,
                ),
                onPressed: () {
                  setState(() {
                    currentIndex = 2;
                  });

                  widget.person.chooseExercise(
                    Running(),
                  );
                },
              ),
            ],
          ),
          OutlinedButton(
            onPressed: () async {
              if (widget.person.leftCalorie <= 0) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('이미 다이어트가 끝났습니다. 칼로리 충전을 눌러주세요.'),
                  ),
                );
                return;
              }

              if (currentIndex == -1) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('운동을 선택하셔야 합니다.'),
                  ),
                );
                return;
              }

              burnedCalories = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) =>
                      ExercisePage(exercise: widget.person.exercise),
                ),
              );

              setState(() {
                widget.person.leftCalorie -= burnedCalories;

                if (widget.person.leftCalorie <= 0) {
                  widget.person.currentState.changeState();
                }
              });
            },
            child: Text('운동 시작'),
          ),
        ],
      ),
    );
  }
}
