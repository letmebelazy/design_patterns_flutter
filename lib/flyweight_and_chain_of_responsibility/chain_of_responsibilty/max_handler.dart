import 'package:design_patterns_flutter/flyweight_and_chain_of_responsibility/chain_of_responsibilty/handler.dart';

class MaxHandler extends Handler {
  MaxHandler(super.next);

  @override
  String gitActivity(int commitCount) {
    if (commitCount > 3) {
      return '\n' + '잔디가 최고로 밝아졌습니다';
    }
    return '';
  }
}
