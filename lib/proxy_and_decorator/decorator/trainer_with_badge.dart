import 'package:design_patterns_flutter/proxy_and_decorator/decorator/trainer_decorator.dart';

class TrainerWithBadge extends TrainerDecorator {
  final String color;
  TrainerWithBadge(this.color, super.trainer);

  @override
  List<String> collectBadge() {
    final List<String> list = [...super.collectBadge()];
    return [...list, color];
  }
}
