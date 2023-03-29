import 'package:flutter/material.dart';

import 'package:design_patterns_flutter/strategy_and_state/views/calories_calculator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Design Patterns',

      // 빼고자 하는 목표 칼로리를 계산해주는 페이지
      home: CaloriesCalculator(),
      // ShoppingMallMenu(
      //   rootCategory: MenuCategory(depthCount: 0, categoryTitle: '메인 카테고리'),
      // ),
      // VendingMachine(),
    );
  }
}
