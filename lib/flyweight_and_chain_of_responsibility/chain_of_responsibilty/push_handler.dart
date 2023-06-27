import 'package:design_patterns_flutter/flyweight_and_chain_of_responsibility/chain_of_responsibilty/handler.dart';

class PushHandler extends Handler {
  PushHandler(super.next);

  @override
  String gitActivity(int commitCount) {
    String result = '';
    if (commitCount > 0) {
      for (int i = 0; i < commitCount; i++) {
        result += '\n' + 'github에 푸시했습니다';
      }
    }
    return result;
  }
}
