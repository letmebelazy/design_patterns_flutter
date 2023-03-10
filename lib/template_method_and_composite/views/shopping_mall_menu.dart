import 'package:flutter/material.dart';

import 'package:design_patterns_flutter/template_method_and_composite/composite_models/menu_category.dart';
import 'package:design_patterns_flutter/template_method_and_composite/template_method/template_method_models/shopping_item.dart';

final List<String> itemCategories = [
  '자켓',
  '셔츠',
  '청바지',
  '반바지',
  '새 카테고리',
];

class ShoppingMallMenu extends StatefulWidget {
  final MenuCategory rootCategory;
  const ShoppingMallMenu({super.key, required this.rootCategory});

  @override
  State<ShoppingMallMenu> createState() => _ShoppingMallMenuState();
}

class _ShoppingMallMenuState extends State<ShoppingMallMenu> {
  List<ShoppingItem> items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: widget.rootCategory,
      ),
    );
  }
}
