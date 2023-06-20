import 'package:design_patterns_flutter/bridge_and_builder/builder/accomodation.dart';
import 'package:design_patterns_flutter/bridge_and_builder/builder/itenerary_builder.dart';
import 'package:design_patterns_flutter/bridge_and_builder/builder/airplane.dart';
import 'package:design_patterns_flutter/bridge_and_builder/builder/restaurant.dart';

class NormalTripBuilder extends IteneraryBuilder {
  NormalTripBuilder({required super.itenerary});

  @override
  Accomodation setAccomodation() {
    return Accomodation('펜션');
  }

  @override
  Restaurant setRestaurant() {
    return Restaurant('식당');
  }

  @override
  Airplane setAirplane() {
    return Airplane('비즈니스');
  }
}
