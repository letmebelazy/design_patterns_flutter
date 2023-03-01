import 'package:design_patterns_flutter/currencies/won.dart';

// 원격으로 환율을 받아오는 서비스라고 가정
class ExchangeRateService {
  static final ExchangeRateService _instance = ExchangeRateService._init();

  // 비공개 생성자가 있으면 기본 생성자를 만들지 않음
  // 즉 다른 생성자가 없다면 이 객체는 인스턴스화 될 수 없음
  ExchangeRateService._init();

  // 기본 생성자를 팩토리 생성자로 선언
  // 공개된 생성자가 이것뿐이므로 이 생성자를 통해서만 인스턴스화 가능
  // 생성자 내부에서 _instance를 리턴하고 _instance는 비공개 생성자로
  factory ExchangeRateService() {
    return _instance;
  }

  // 입력 받은 원화의 가치를 달러, 유로, 엔화의 가치로 반환해준다
  // 하드코딩으로 환율값이 들어가있지만 원격 API에서 받아오는 것이라고 가정
  int getDollarValue(Won won) {
    int dollarValue = won.faceValue ~/ 1310;
    return dollarValue;
  }

  int getYenValue(Won won) {
    int yenValue = won.faceValue ~/ 9;
    return yenValue;
  }
}
