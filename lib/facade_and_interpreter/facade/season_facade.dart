import 'package:design_patterns_flutter/facade_and_interpreter/facade/humidity_controller.dart';
import 'package:design_patterns_flutter/facade_and_interpreter/facade/snow_creator.dart';
import 'package:design_patterns_flutter/facade_and_interpreter/facade/temperature_controller.dart';
import 'package:design_patterns_flutter/facade_and_interpreter/facade/weather_state.dart';

// 온도 컨트롤러, 습도 컨트롤러, 눈 생성자를 갖고 있다
class SeasonFacade {
  final TemperatureController temperatureController;
  final HumidityController humidityController;
  final SnowCreator snowCreator;

  SeasonFacade({
    required this.temperatureController,
    required this.humidityController,
    required this.snowCreator,
  });

  // 각 계절에 맞게끔 상태를 변경
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

  // 겨울의 경우 다른 계절과 다르게 눈 생성자가 작동
  void makeItWinter(WeatherState state) {
    state.temparature = temperatureController.setTemperature(temperature: -0.3);
    state.humidity = humidityController.setHumidity(humidity: 56.1);
    state.isSnowing = snowCreator.makeSnow();
  }
}
