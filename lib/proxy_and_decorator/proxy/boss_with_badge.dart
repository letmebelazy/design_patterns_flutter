import 'package:design_patterns_flutter/proxy_and_decorator/proxy/boss.dart';

class BossWithBadge implements Boss {
  final String badgeColor;
  BossWithBadge({required this.badgeColor});

  @override
  String giveBadge() {
    return badgeColor;
  }
}
