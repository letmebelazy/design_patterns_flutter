import 'package:design_patterns_flutter/template_method_and_composite/shopping_mall_menu.dart';
import 'package:flutter/material.dart';

import 'package:design_patterns_flutter/singleton_and_adapter/vending_machine.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Design Patterns', home: ShoppingMallMenu(),
      // VendingMachine(),
    );
  }
}
