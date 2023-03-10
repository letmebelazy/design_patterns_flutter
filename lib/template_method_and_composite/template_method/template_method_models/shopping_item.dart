import 'package:flutter/material.dart';

abstract class ShoppingItem {
  final String name;
  final int price;

  ShoppingItem({
    required this.name,
    required this.price,
  });

  // 템플릿 메서드
  int getPracticalPrice() {
    final discountAmount = getDiscountAmount();

    return price - discountAmount;
  }

  // 훅
  @protected
  int getDiscountAmount();
}
