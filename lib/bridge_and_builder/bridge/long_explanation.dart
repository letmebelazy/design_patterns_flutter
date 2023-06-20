import 'package:design_patterns_flutter/bridge_and_builder/bridge/trip_explanation.dart';
import 'package:design_patterns_flutter/bridge_and_builder/builder/itenerary.dart';

class LongExplanation implements TripExplanation {
  @override
  String explain(Itenerary itenerary) {
    return '${itenerary.level}은 ${itenerary.airplane.name}를 타고 가서 ${itenerary.accomodation.name}에 묵고, ${itenerary.restaurant.name}에서 식사한다';
  }
}
