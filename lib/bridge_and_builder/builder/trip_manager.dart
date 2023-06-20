import 'package:design_patterns_flutter/bridge_and_builder/builder/itenerary.dart';
import 'package:design_patterns_flutter/bridge_and_builder/builder/itenerary_builder.dart';

class TripManager {
  IteneraryBuilder builder;

  TripManager(this.builder);

  void changeBuilder(IteneraryBuilder builder) {
    this.builder = builder;
  }

  Itenerary buildTrip() {
    builder.itenerary.accomodation = builder.setAccomodation();
    builder.itenerary.airplane = builder.setAirplane();
    builder.itenerary.restaurant = builder.setRestaurant();

    return builder.itenerary;
  }
}
