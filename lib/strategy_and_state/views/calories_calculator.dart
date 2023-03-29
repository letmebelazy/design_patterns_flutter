import 'package:design_patterns_flutter/strategy_and_state/person.dart';
import 'package:design_patterns_flutter/strategy_and_state/views/detail_page.dart';
import 'package:flutter/material.dart';

class CaloriesCalculator extends StatelessWidget {
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
