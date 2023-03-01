import 'package:design_patterns_flutter/currencies/won.dart';
import 'package:design_patterns_flutter/singleton/exchange_rate_service.dart';

// 어댑터 추상클래스
abstract class CurrencyAdapter {
  final Won won;
  final ExchangeRateService service;

  CurrencyAdapter({required this.won, required this.service});
}
