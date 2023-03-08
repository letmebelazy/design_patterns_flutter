import 'package:design_patterns_flutter/template_method_and_composite/template_method/jacket.dart';
import 'package:design_patterns_flutter/template_method_and_composite/template_method/jeans.dart';
import 'package:design_patterns_flutter/template_method_and_composite/template_method/shirt.dart';
import 'package:design_patterns_flutter/template_method_and_composite/template_method/shopping_item.dart';
import 'package:design_patterns_flutter/template_method_and_composite/template_method/shorts.dart';
import 'package:flutter/material.dart';

class ShoppingMallMenu extends StatefulWidget {
  const ShoppingMallMenu({super.key});

  @override
  State<ShoppingMallMenu> createState() => _ShoppingMallMenuState();
}

class _ShoppingMallMenuState extends State<ShoppingMallMenu> {
  final List<String> itemCategories = [
    '자켓',
    '셔츠',
    '청바지',
    '반바지',
  ];
  List<ShoppingItem> items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (_, index) {
          return Container(
            width: double.infinity,
            height: 50.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    items[index].name,
                    style: TextStyle(fontSize: 24.0),
                  ),
                  Spacer(),
                  Text(
                    '${items[index].price}',
                    style: TextStyle(
                      fontSize: 14.0,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  Text(
                    '${items[index].getPracticalPrice()}',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              String category = '자켓';
              String name = '';
              String priceStr = '';

              return AlertDialog(
                title: Column(
                  children: [
                    // dialog 내에선 setState로 업데이트할 수 없으므로
                    // Stateful builder로 감싸줘야 함
                    StatefulBuilder(
                      builder: (context, setState) {
                        return DropdownButton<String>(
                          value: category,
                          items: itemCategories
                              .map((e) => DropdownMenuItem<String>(
                                    value: e,
                                    child: Text(e),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              category = value!;
                            });
                          },
                        );
                      },
                    ),
                    SizedBox(
                      width: 200.0,
                      height: 50.0,
                      child: TextFormField(
                        onChanged: (value) => name = value,
                      ),
                    ),
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
                      if (name.isEmpty || priceStr.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('잘못된 값을 입력하셨습니다.'),
                          ),
                        );
                      }

                      ShoppingItem newItem = Jacket(name: '', price: 0);

                      if (category == '자켓') {
                        int price = int.parse(priceStr);
                        print(price);
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

                      setState(() {
                        items.add(newItem);
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
        child: Icon(Icons.add),
      ),
    );
  }
}
