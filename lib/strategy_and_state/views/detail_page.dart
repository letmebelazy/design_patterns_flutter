import 'package:design_patterns_flutter/strategy_and_state/person.dart';
import 'package:design_patterns_flutter/strategy_and_state/state/diet_done.dart';
import 'package:design_patterns_flutter/strategy_and_state/strategy/boxing.dart';
import 'package:design_patterns_flutter/strategy_and_state/strategy/football.dart';
import 'package:design_patterns_flutter/strategy_and_state/strategy/running.dart';
import 'package:design_patterns_flutter/strategy_and_state/strategy/swimming.dart';
import 'package:design_patterns_flutter/strategy_and_state/views/exercise_page.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  // 사람 객체를 생성자로 받고 있음
  final Person person;

  const DetailPage({
    super.key,
    required this.person,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  // 운동 리스트
  List<String> exercises = ['복싱', '수영', '러닝', '축구'];
  // 플래그 변수
  int currentIndex = -1;
  // 운동으로 소모한 칼로리
  // 운동 페이지에서 운동한 이후 돌아오며 비동기로 갱신됨
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
        // 사람의 다이어트 상태에 따라 컬러가 변화
        backgroundColor:
            widget.person.currentState is DietDone ? Colors.blue : Colors.red,

        // 다이어트 상태를 텍스트로 보여줌
        title: Text(
          widget.person.currentState.getCurrentState(),
        ),
        actions: [
          // 다시 하기 기능
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

          // 현재 남은 칼로리를 Person 객체에서 받고 있음
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
              TextButton(
                child: Text(
                  exercises[3],
                  style: currentIndex == 3 ? focusedStyle : normalStyle,
                ),
                onPressed: () {
                  setState(() {
                    currentIndex = 3;
                  });

                  widget.person.chooseExercise(
                    Football(),
                  );
                },
              ),
            ],
          ),
          OutlinedButton(
            onPressed: () async {
              // 간단한 유효성 검증 로직
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

              // 운동 페이지에서 소모한 칼로리를 비동기로 받아서 이 화면에서 갱신
              burnedCalories = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) =>
                      ExercisePage(exercise: widget.person.exercise),
                ),
              );

              setState(() {
                widget.person.leftCalorie -= burnedCalories;

                // 운동 후 칼로리가 0이하면 상태를 바꿈
                // 특정 상태를 주입하거나 특정 상태의 메서드를 이용하는 게 아닌
                // 현재 상태의 메서드를 이용하는 것이 포인트
                // currentState는 DietState로 선언되어 있고
                // 모든 상태들이 DietState 인터페이스를 구현하기 때문에
                // 다형성이 성립한다
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
