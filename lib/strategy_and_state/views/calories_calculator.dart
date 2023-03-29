import 'package:design_patterns_flutter/strategy_and_state/person.dart';
import 'package:design_patterns_flutter/strategy_and_state/views/detail_page.dart';
import 'package:flutter/material.dart';

// 목표한 칼로리 소모를 선택한 운동에 맞춰 계산해주는 위젯(페이지)
class CaloriesCalculator extends StatelessWidget {
  // Stateless Widget을 쓰지만 final로 사용하지 않는 이유는
  // 실제로 위젯 트리에서 상태 변화에 따라 다시 그려야하는 경우가 없으나
  // 목표 칼로리를 입력할 때 값은 변해야하기 때문
  String calories = '0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('목표 소모칼로리를 3자리나 4자리로 입력하세요.'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80.0),
          child: TextField(
            keyboardType: TextInputType.number,
            textAlign: TextAlign.right,
            onChanged: (value) {
              calories = value;
            },
          ),
        ),
        TextButton(
          onPressed: () {
            int? parsedCalories = int.tryParse(calories);
            if (parsedCalories == null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('숫자만 입력하세요.'),
                ),
              );
              return;
            }

            if (calories.length > 4) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('칼로리는 4자리까지 입력하셔야 합니다.'),
                ),
              );
              return;
            }

            if (calories.length < 2) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('칼로리를 3자리 이상 입력하셔야 합니다.'),
                ),
              );
              return;
            }

            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => DetailPage(
                  person: Person(
                    leftCalorie: parsedCalories,
                  ),
                ),
              ),
            );
          },
          child: Text('확인'),
        ),
      ],
    ));
  }
}
