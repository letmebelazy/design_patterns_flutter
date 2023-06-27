import 'package:design_patterns_flutter/flyweight_and_chain_of_responsibility/chain_of_responsibilty/handler.dart';

class LoginHandler extends Handler {
  LoginHandler(super.next);

  @override
  String gitActivity(int commitCount) {
    return 'github에 로그인했습니다';
  }
}
