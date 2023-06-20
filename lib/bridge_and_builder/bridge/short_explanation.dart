import 'package:design_patterns_flutter/bridge_and_builder/bridge/trip_explanation.dart';
import 'package:design_patterns_flutter/bridge_and_builder/builder/itenerary.dart';

class ShortExplanation implements TripExplanation {
  @override
  String explain(Itenerary itenerary) {
    return '${itenerary.level}: ${itenerary.airplane.name}, ${itenerary.accomodation.name}, ${itenerary.restaurant.name}';
  }
}
