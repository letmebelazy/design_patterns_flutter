import 'package:design_patterns_flutter/proxy_and_decorator/decorator/trainer.dart';

class TrainerDecorator implements Trainer {
  late final Trainer _trainer;
  TrainerDecorator(this._trainer);

  @override
  List<String> collectBadge() {
    return _trainer.collectBadge();
  }
}
