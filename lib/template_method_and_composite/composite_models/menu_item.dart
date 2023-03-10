import 'package:flutter/material.dart';

import 'package:design_patterns_flutter/template_method_and_composite/composite_models/menu.dart';
import 'package:design_patterns_flutter/template_method_and_composite/template_method/template_method_models/shopping_item.dart';

class MenuItem extends Menu {
  final ShoppingItem item;

  MenuItem({
    required super.depthCount,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    String depthSpaces = '';
    for (int i = 0; i < depthCount; i++) {
      depthSpaces += '  ';
    }

    return Container(
      width: double.infinity,
      height: 50.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              depthSpaces + item.name,
              style: TextStyle(fontSize: 24.0),
            ),
            Spacer(),
            if (item.price != item.getPracticalPrice())
              Text(
                '${item.price}',
                style: TextStyle(
                  fontSize: 14.0,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            Text(
              '${item.getPracticalPrice()}',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
