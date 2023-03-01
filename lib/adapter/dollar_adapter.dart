import 'package:design_patterns_flutter/adapter/adapter.dart';
import 'package:design_patterns_flutter/currencies/dollar.dart';

class DollarAdapter extends CurrencyAdapter implements Dollar {
  DollarAdapter({
    required super.won,
    required super.service,
  });

  @override
  int get faceValue {
    return service.getDollarValue(won);
  }
}
