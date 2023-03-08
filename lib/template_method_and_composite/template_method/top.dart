import 'package:design_patterns_flutter/template_method_and_composite/template_method/shopping_item.dart';

class Top extends ShoppingItem {
  Top({required super.name, required super.price});

  // 상의는 20% 항시 할인한다
  @override
  int getDiscountAmount() {
    final discountAmount = price * 0.2;

    return discountAmount.toInt();
  }
}
