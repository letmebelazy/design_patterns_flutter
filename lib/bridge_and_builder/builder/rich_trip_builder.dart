import 'package:design_patterns_flutter/bridge_and_builder/builder/accomodation.dart';
import 'package:design_patterns_flutter/bridge_and_builder/builder/itenerary_builder.dart';
import 'package:design_patterns_flutter/bridge_and_builder/builder/airplane.dart';
import 'package:design_patterns_flutter/bridge_and_builder/builder/restaurant.dart';

class RichTripBuilder extends IteneraryBuilder {
  RichTripBuilder({required super.itenerary});

  @override
  Accomodation setAccomodation() {
    return Accomodation('호텔');
  }

  @override
  Restaurant setRestaurant() {
    return Restaurant('파인다이닝');
  }

  @override
  Airplane setAirplane() {
    return Airplane('퍼스트');
  }
}
