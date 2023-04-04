import 'package:design_patterns_flutter/facade_and_interpreter/view/season_changer.dart';
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

      home: SeasonChanger(),
      // CaloriesCalculator(),
      // ShoppingMallMenu(
      //   rootCategory: MenuCategory(depthCount: 0, categoryTitle: '메인 카테고리'),
      // ),
      // VendingMachine(),
    );
  }
}
