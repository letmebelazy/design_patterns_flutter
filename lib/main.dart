import 'package:design_patterns_flutter/adapter/dollar_adapter.dart';
import 'package:design_patterns_flutter/adapter/yen_adapter.dart';
import 'package:design_patterns_flutter/currencies/currency.dart';
import 'package:design_patterns_flutter/currencies/dollar.dart';
import 'package:design_patterns_flutter/currencies/won.dart';
import 'package:design_patterns_flutter/currencies/yen.dart';
import 'package:design_patterns_flutter/singleton/exchange_rate_service.dart';
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
      home: VendingMachine(),
    );
  }
}

class VendingMachine extends StatefulWidget {
  VendingMachine({super.key});

  @override
  State<VendingMachine> createState() => _VendingMachineState();
}

class _VendingMachineState extends State<VendingMachine> {
  int? currentGoodsIndex;
  int? currentCurrencyIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          width: 300.0,
          height: 600.0,
          color: Colors.red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        currentGoodsIndex = 0;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          width: 5.0,
                          color: currentGoodsIndex == 0
                              ? Colors.black
                              : Colors.transparent,
                        ),
                      ),
                      child: Text(
                        '티머니카드\n5000원',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        currentGoodsIndex = 1;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          width: 5.0,
                          color: currentGoodsIndex == 1
                              ? Colors.black
                              : Colors.transparent,
                        ),
                      ),
                      child: Text(
                        '보조배터리\n10000원',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        currentCurrencyIndex = 0;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 80.0,
                      height: 80.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          width: 5.0,
                          color: currentCurrencyIndex == 0
                              ? Colors.black
                              : Colors.transparent,
                        ),
                      ),
                      child: Text(
                        '원',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        currentCurrencyIndex = 1;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 80.0,
                      height: 80.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          width: 5.0,
                          color: currentCurrencyIndex == 1
                              ? Colors.black
                              : Colors.transparent,
                        ),
                      ),
                      child: Text(
                        'Dollar',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        currentCurrencyIndex = 2;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 80.0,
                      height: 80.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          width: 5.0,
                          color: currentCurrencyIndex == 2
                              ? Colors.black
                              : Colors.transparent,
                        ),
                      ),
                      child: Text(
                        '円',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  if (currentGoodsIndex == null ||
                      currentCurrencyIndex == null) {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text('상품과 화폐를 모두 선택해주십시오.'),
                      ),
                    );
                  }

                  if (currentCurrencyIndex == 0) {
                    Won won;
                    if (currentGoodsIndex == 0) {
                      won = Won(faceValue: 5000);
                    } else {
                      won = Won(faceValue: 10000);
                    }
                    _showDialog(won);
                  }

                  if (currentCurrencyIndex == 1) {
                    Won won;
                    DollarAdapter adapter;
                    ExchangeRateService service = ExchangeRateService();
                    if (currentGoodsIndex == 0) {
                      won = Won(faceValue: 5000);
                      adapter = DollarAdapter(
                        won: won,
                        service: service,
                      );
                    } else {
                      won = Won(faceValue: 10000);
                      adapter = DollarAdapter(
                        won: won,
                        service: service,
                      );
                    }
                    _showDialog(adapter);
                  }

                  if (currentCurrencyIndex == 2) {
                    Won won;
                    YenAdapter adapter;
                    ExchangeRateService service = ExchangeRateService();
                    if (currentGoodsIndex == 0) {
                      won = Won(faceValue: 5000);
                      adapter = YenAdapter(
                        won: won,
                        service: service,
                      );
                    } else {
                      won = Won(faceValue: 10000);
                      adapter = YenAdapter(
                        won: won,
                        service: service,
                      );
                    }
                    _showDialog(adapter);
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 200.0,
                  height: 80.0,
                  color:
                      currentGoodsIndex != null && currentCurrencyIndex != null
                          ? Colors.white
                          : Colors.grey,
                  child: Text(
                    currentCurrencyIndex == 1
                        ? 'Check price'
                        : currentCurrencyIndex == 2
                            ? '価格確認'
                            : '넣어야할 금액 확인',
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.w700),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showDialog(Currency currency) {
    if (currency is Dollar) {
      showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text('Please insert ${currency.faceValue}'),
          );
        },
      );
      return;
    }

    if (currency is Yen) {
      showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text('${currency.faceValue}円を入れてください'),
          );
        },
      );
      return;
    }

    if (currency is Won) {
      showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text('${currency.faceValue}원을 삽입해주십시오'),
          );
        },
      );
      return;
    }
  }
}
