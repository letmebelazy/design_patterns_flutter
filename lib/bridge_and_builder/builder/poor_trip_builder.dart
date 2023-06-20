import 'package:design_patterns_flutter/bridge_and_builder/builder/airplane.dart';
import 'package:design_patterns_flutter/bridge_and_builder/builder/accomodation.dart';
import 'package:design_patterns_flutter/bridge_and_builder/builder/itenerary_builder.dart';
import 'package:design_patterns_flutter/bridge_and_builder/builder/restaurant.dart';

class PoorTripBuilder extends IteneraryBuilder {
  PoorTripBuilder({required super.itenerary});

  @override
  Accomodation setAccomodation() {
    return Accomodation('민박');
  }

  @override
  Airplane setAirplane() {
    return Airplane('이코노미');
  }

  @override
  Restaurant setRestaurant() {
    return Restaurant('편의점');
  }
}
