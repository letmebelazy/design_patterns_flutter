import 'package:design_patterns_flutter/template_method_and_composite/composite_models/menu_category.dart';
import 'package:flutter/material.dart';

import 'package:design_patterns_flutter/template_method_and_composite/views/shopping_mall_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Design Patterns',
      home: ShoppingMallMenu(
        rootCategory: MenuCategory(depthCount: 0, categoryTitle: '메인 카테고리'),
      ),
      // VendingMachine(),
    );
  }
}
