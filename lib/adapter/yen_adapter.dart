import 'package:design_patterns_flutter/adapter/adapter.dart';
import 'package:design_patterns_flutter/currencies/yen.dart';

class YenAdapter extends CurrencyAdapter implements Yen {
  YenAdapter({
    required super.won,
    required super.service,
  });

  @override
  int get faceValue {
    return service.getYenValue(won);
  }
}
