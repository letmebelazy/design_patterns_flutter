import 'package:flutter/material.dart';

import 'package:design_patterns_flutter/facade_and_interpreter/facade/weather_state.dart';
import 'package:design_patterns_flutter/facade_and_interpreter/facade/humidity_controller.dart';
import 'package:design_patterns_flutter/facade_and_interpreter/facade/season_facade.dart';
import 'package:design_patterns_flutter/facade_and_interpreter/facade/snow_creator.dart';
import 'package:design_patterns_flutter/facade_and_interpreter/facade/temperature_controller.dart';
import 'package:design_patterns_flutter/facade_and_interpreter/interpreter/motion.dart';
import 'package:design_patterns_flutter/facade_and_interpreter/interpreter/movement.dart';
import 'package:design_patterns_flutter/facade_and_interpreter/interpreter/rotation.dart';

class SeasonChanger extends StatefulWidget {
  const SeasonChanger({super.key});

  @override
  State<SeasonChanger> createState() => _SeasonChangerState();
}

class _SeasonChangerState extends State<SeasonChanger> {
  // (-2, 2) (-1, 2) (0, 2) (1, 2) (2, 2)
  // (-2, 1) (-1, 1) (0, 1) (1, 1) (2, 1)
  // (-2, 0) (-1, 0) (0, 0) (1, 0) (2, 0)
  // (-2,-1) (-1,-1) (0,-1) (1,-1) (2,-1)
  // (-2,-2) (-1,-2) (0,-2) (1,-2) (2,-2)
  // 인덱스별로 위치값을 할당
  final List<Offset> offsets = List<Offset>.generate(25, (index) {
    double x = index % 5 - 2;
    double y = 2.0 - index ~/ 5;
    return Offset(x, y);
  });

  // 파사드 객체 선언
  final SeasonFacade facade = SeasonFacade(
    temperatureController: TemperatureController(),
    humidityController: HumidityController(),
    snowCreator: SnowCreator(),
  );

  // 상태 선언
  final WeatherState state = WeatherState();

  // 계절이 달라지면 앱바 색이 달라짐. 앱바 색의 초기값
  Color appBarColor = Colors.white;

  // 방향키&이동 문자 입력
  String input = '';

  // 현재 인덱스 초기값 -1
  // -1은 0~24의 인덱스에 해당하지 않을뿐만 아니라
  // 추후 나올 indexWhere 메서드에서 해당 컬렉션에 해당 값이 없을 때 반환되는 숫자
  int currentIndex = -1;

  // 처음 위치는 중앙: (0,0)
  Offset currentOffset = Offset(0, 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(''),
        backgroundColor: appBarColor,
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 150.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '온도',
                      style: TextStyle(
                        fontSize: 36.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      '${state.temparature}℃',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '습도',
                      style: TextStyle(
                        fontSize: 36.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      '${state.humidity}%',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
                if (state.isSnowing)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '눈',
                        style: TextStyle(
                          fontSize: 36.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        'ing',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: 25,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      border: Border.all(color: Colors.black12),
                    ),
                    child: Stack(
                      children: [
                        Text(
                          '봄',
                          style: TextStyle(
                            fontSize: 24.0,
                            color: Colors.white,
                          ),
                        ),
                        if (currentIndex == 0)
                          Image.asset(
                            'assets/plane.png',
                          ),
                      ],
                    ),
                  );
                }
                if (index == 4) {
                  return Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      border: Border.all(color: Colors.black12),
                    ),
                    child: Stack(
                      children: [
                        Text(
                          '여름',
                          style: TextStyle(
                            fontSize: 24.0,
                            color: Colors.white,
                          ),
                        ),
                        if (currentIndex == 4)
                          Image.asset(
                            'assets/plane.png',
                          ),
                      ],
                    ),
                  );
                }
                if (index == 20) {
                  return Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      border: Border.all(color: Colors.black12),
                    ),
                    child: Stack(
                      children: [
                        Text(
                          '가을',
                          style: TextStyle(
                            fontSize: 24.0,
                            color: Colors.white,
                          ),
                        ),
                        if (currentIndex == 20)
                          Image.asset(
                            'assets/plane.png',
                          ),
                      ],
                    ),
                  );
                }
                if (index == 24) {
                  return Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        border: Border.all(color: Colors.black12),
                      ),
                      child: Stack(
                        children: [
                          Text(
                            '겨울',
                            style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.white,
                            ),
                          ),
                          if (currentIndex == 24)
                            Image.asset(
                              'assets/plane.png',
                            ),
                        ],
                      ));
                }
                if (index == 12) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.black12),
                    ),
                    child: currentIndex == 12 || currentIndex == -1
                        ? Image.asset(
                            'assets/plane.png',
                          )
                        : null,
                  );
                }
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.black12),
                  ),
                  child: currentIndex == index
                      ? Image.asset(
                          'assets/plane.png',
                        )
                      : null,
                );
              },
            ),
          ),
          SizedBox(
            height: 220.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  width: double.infinity,
                  height: 40.0,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black38),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    input,
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                SizedBox(height: 20.0),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      input += '↑';
                    });
                  },
                  child: Icon(Icons.arrow_upward),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          input += '←';
                        });
                      },
                      child: Icon(Icons.arrow_back),
                    ),
                    SizedBox(width: 20.0),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          input += '→';
                        });
                      },
                      child: Icon(Icons.arrow_forward),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      input += '↓';
                    });
                  },
                  child: Icon(Icons.arrow_downward),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        setState(() {
                          input += 'M';
                        });
                      },
                      child: Text(
                        '이동',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                    SizedBox(width: 20.0),
                    OutlinedButton(
                      onPressed: () {
                        setState(() {
                          currentOffset = actionInterpret(currentOffset);
                          currentIndex = offsets.indexWhere(
                            (e) => e == currentOffset,
                          );
                          input = '';

                          switch (currentIndex) {
                            case 0:
                              {
                                setState(() {
                                  appBarColor = Colors.green;
                                  facade.makeItSpring(state);
                                });
                                break;
                              }
                            case 4:
                              {
                                setState(() {
                                  appBarColor = Colors.red;
                                  facade.makeItSummer(state);
                                });
                                break;
                              }
                            case 20:
                              {
                                setState(() {
                                  appBarColor = Colors.blue;
                                  facade.makeItAutumn(state);
                                });
                                break;
                              }
                            case 24:
                              {
                                setState(() {
                                  appBarColor = Colors.grey;
                                  facade.makeItWinter(state);
                                });
                                break;
                              }
                            default:
                              {}
                          }
                        });
                      },
                      child: Text(
                        '완료',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Offset actionInterpret(Offset currentOffset) {
    final List<Motion> motions = [];
    final List<String> inputCharacters = input.split('');
    Offset changedOffset = currentOffset;

    for (String char in inputCharacters) {
      switch (char) {
        case '←':
          {
            motions.add(LeftRotation());
            break;
          }
        case '→':
          {
            motions.add(RightRotation());
            break;
          }
        case '↑':
          {
            motions.add(TopRotation());
            break;
          }
        case '↓':
          {
            motions.add(BottomRotation());
            break;
          }
        default:
          {
            Movement movement = Movement(
              rotation: motions.last,
              currentOffset: changedOffset,
            );
            motions.add(movement);
            changedOffset = movement.interpret();
            break;
          }
      }
    }

    return changedOffset;
  }
}
