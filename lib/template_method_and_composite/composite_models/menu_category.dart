import 'package:flutter/material.dart';

import 'package:design_patterns_flutter/template_method_and_composite/template_method/template_method_models/jeans.dart';
import 'package:design_patterns_flutter/template_method_and_composite/template_method/template_method_models/shorts.dart';
import 'package:design_patterns_flutter/template_method_and_composite/template_method/template_method_models/shopping_item.dart';
import 'package:design_patterns_flutter/template_method_and_composite/template_method/template_method_models/jacket.dart';
import 'package:design_patterns_flutter/template_method_and_composite/template_method/template_method_models/shirt.dart';
import 'package:design_patterns_flutter/template_method_and_composite/views/shopping_mall_menu.dart';
import 'package:design_patterns_flutter/template_method_and_composite/composite_models/menu.dart';
import 'package:design_patterns_flutter/template_method_and_composite/composite_models/menu_item.dart'
    as menu;

class MenuCategory extends Menu {
  final String categoryTitle;
  final List<Menu> menus = [];

  MenuCategory({
    required super.depthCount,
    required this.categoryTitle,
  });

  void add(Menu menu) {
    menus.add(menu);
  }

  @override
  Widget build(BuildContext context) {
    return _CustomExpansionTile(
      depthCount: depthCount,
      categoryTitle: categoryTitle,
      menus: menus,
    );
  }
}

class _CustomExpansionTile extends StatefulWidget {
  final String categoryTitle;
  final int depthCount;
  final List<Menu> menus;

  const _CustomExpansionTile({
    required this.depthCount,
    required this.categoryTitle,
    required this.menus,
  });

  @override
  State<_CustomExpansionTile> createState() => __CustomExpansionTileState();
}

class __CustomExpansionTileState extends State<_CustomExpansionTile> {
  @override
  Widget build(BuildContext context) {
    String depthSpaces = '';
    for (int i = 0; i < widget.depthCount; i++) {
      depthSpaces += '  ';
    }
    
    return ExpansionTile(
      initiallyExpanded: true,
      title: Text(
        depthSpaces + widget.categoryTitle,
        style: TextStyle(
          fontSize: 32.0,
          fontWeight: FontWeight.w900,
          color: Colors.blue,
        ),
      ),
      children: widget.menus,
      trailing: IconButton(
        icon: Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              String category = '자켓';
              String name = '';
              String priceStr = '';

              return StatefulBuilder(
                builder: (context, builderSetState) {
                  return AlertDialog(
                    title: Column(
                      children: [
                        // dialog 내에선 setState로 업데이트할 수 없으므로
                        // Stateful builder로 감싸줘야 함
                        DropdownButton<String>(
                          value: category,
                          items: itemCategories
                              .map(
                                (e) => DropdownMenuItem<String>(
                                  value: e,
                                  child: Text(e),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            builderSetState(() {
                              category = value!;
                            });
                          },
                        ),

                        SizedBox(
                          width: 200.0,
                          height: 50.0,
                          child: TextFormField(
                            onChanged: (value) => name = value,
                          ),
                        ),
                        if (category != '새 카테고리')
                          SizedBox(
                            width: 200.0,
                            height: 50.0,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              onChanged: (value) => priceStr = value,
                            ),
                          ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          if (category == '새 카테고리') {
                            if (name.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('잘못된 값을 입력하셨습니다.'),
                                ),
                              );
                            }
                          } else {
                            if (name.isEmpty || priceStr.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('잘못된 값을 입력하셨습니다.'),
                                ),
                              );
                            }
                          }

                          ShoppingItem newItem = Jacket(name: '', price: 0);

                          if (category == '자켓') {
                            int price = int.parse(priceStr);
                            newItem = Jacket(
                              name: name,
                              price: price,
                            );
                          }

                          if (category == '셔츠') {
                            newItem = Shirt(
                              name: name,
                              price: int.parse(priceStr),
                            );
                          }

                          if (category == '청바지') {
                            newItem = Jeans(
                              name: name,
                              price: int.parse(priceStr),
                            );
                          }

                          if (category == '반바지') {
                            newItem = Shorts(
                              name: name,
                              price: int.parse(priceStr),
                            );
                          }

                          if (category == '새 카테고리') {
                            MenuCategory newCategory = MenuCategory(
                              depthCount: widget.depthCount + 1,
                              categoryTitle: name,
                            );
                            setState(() {
                              widget.menus.add(newCategory);
                            });
                            Navigator.pop(context);
                            return;
                          }

                          setState(() {
                            menu.MenuItem newMenuItem = menu.MenuItem(
                              depthCount: widget.depthCount + 1,
                              item: newItem,
                            );
                            widget.menus.add(newMenuItem);
                          });

                          Navigator.pop(context);
                        },
                        child: Text('확인'),
                      )
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
