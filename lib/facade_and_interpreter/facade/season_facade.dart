import 'package:design_patterns_flutter/facade_and_interpreter/facade/humidity_controller.dart';
import 'package:design_patterns_flutter/facade_and_interpreter/facade/snow_creator.dart';
import 'package:design_patterns_flutter/facade_and_interpreter/facade/temperature_controller.dart';
import 'package:design_patterns_flutter/facade_and_interpreter/facade/weather_state.dart';

class SeasonFacade {
  final TemperatureController temperatureController;
  final HumidityController humidityController;
  final SnowCreator snowCreator;

  SeasonFacade({
    required this.temperatureController,
    required this.humidityController,
    required this.snowCreator,
  });

  void makeItSpring(WeatherState state) {
    state.temparature = temperatureController.setTemperature(temperature: 12.3);
    state.humidity = humidityController.setHumidity(humidity: 56.4);
  }

  void makeItSummer(WeatherState state) {
    state.temparature = temperatureController.setTemperature(temperature: 24.7);
    state.humidity = humidityController.setHumidity(humidity: 71.8);
  }

  void makeItAutumn(WeatherState state) {
    state.temparature = temperatureController.setTemperature(temperature: 14.7);
    state.humidity = humidityController.setHumidity(humidity: 62.9);
  }

  void makeItWinter(WeatherState state) {
    state.temparature = temperatureController.setTemperature(temperature: -0.3);
    state.humidity = humidityController.setHumidity(humidity: 56.1);
    state.isSnowing = snowCreator.makeSnow();
  }
}
