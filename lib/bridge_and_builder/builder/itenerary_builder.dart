import 'package:design_patterns_flutter/bridge_and_builder/builder/accomodation.dart';
import 'package:design_patterns_flutter/bridge_and_builder/builder/itenerary.dart';
import 'package:design_patterns_flutter/bridge_and_builder/builder/restaurant.dart';
import 'package:design_patterns_flutter/bridge_and_builder/builder/airplane.dart';

abstract class IteneraryBuilder {
  Itenerary itenerary;

  IteneraryBuilder({required this.itenerary});

  Airplane setAirplane();
  Accomodation setAccomodation();
  Restaurant setRestaurant();
}
