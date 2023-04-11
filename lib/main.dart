import 'package:design_patterns_flutter/iterator_and_factory_method/view/collection_comparison.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Design Patterns',

      home: CollectionComparison(), // 반복자/팩토리메서드 패턴
      // SeasonChanger(), // 파사드/인터프리터 패턴
      // CaloriesCalculator(), // 전략/상태 패턴
      // ShoppingMallMenu( // 템플릿메서드/컴포지트 패턴
      //   rootCategory: MenuCategory(depthCount: 0, categoryTitle: '메인 카테고리'),
      // ),
      // VendingMachine(), // 싱글턴/어댑터 패턴
    );
  }
}
