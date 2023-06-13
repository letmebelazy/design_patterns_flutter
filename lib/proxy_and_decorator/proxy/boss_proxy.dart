import 'package:design_patterns_flutter/proxy_and_decorator/proxy/boss.dart';
import 'package:design_patterns_flutter/proxy_and_decorator/proxy/boss_with_badge.dart';

class BossProxy implements Boss {
  final String badgeColor;
  Boss? boss;
  BossProxy({required this.badgeColor});

  @override
  String giveBadge() {
    if (boss == null) {
      boss = BossWithBadge(badgeColor: badgeColor);
      return '';
    }
    return boss!.giveBadge();
  }
}
