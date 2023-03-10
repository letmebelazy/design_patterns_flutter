import 'package:design_patterns_flutter/template_method_and_composite/template_method/template_method_models/shopping_item.dart';

class Bottom extends ShoppingItem {
  Bottom({required super.name, required super.price});

  // 하의는 가격이 만원 이상일 때 5000원 항시 할인한다
  @override
  int getDiscountAmount() {
    if (price >= 10000) {
      return 5000;
    }
    return 0;
  }
}
