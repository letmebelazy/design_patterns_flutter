// 온도, 습도, 눈이 오는지 안 오는지 상태를 갖고 있다
class WeatherState {
  double temparature;
  double humidity;
  bool isSnowing;

  WeatherState({
    this.temparature = 20.0,
    this.humidity = 70.0,
    this.isSnowing = false,
  });
}
