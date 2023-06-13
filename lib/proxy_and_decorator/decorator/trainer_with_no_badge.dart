import 'package:design_patterns_flutter/proxy_and_decorator/decorator/trainer.dart';

class TrainerWithNoBadge implements Trainer {
  @override
  List<String> collectBadge() {
    return [];
  }
}
