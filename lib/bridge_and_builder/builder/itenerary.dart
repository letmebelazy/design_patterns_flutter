import 'package:design_patterns_flutter/bridge_and_builder/bridge/trip_explanation.dart';
import 'package:design_patterns_flutter/bridge_and_builder/builder/accomodation.dart';
import 'package:design_patterns_flutter/bridge_and_builder/builder/restaurant.dart';
import 'package:design_patterns_flutter/bridge_and_builder/builder/airplane.dart';

class Itenerary {
  final String level;
  late final Airplane airplane;
  late final Accomodation accomodation;
  late final Restaurant restaurant;

  Itenerary({required this.level});

  String explain(TripExplanation explanation) {
    return explanation.explain(this);
  }
}
