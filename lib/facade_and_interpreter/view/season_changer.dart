import 'package:design_patterns_flutter/facade_and_interpreter/facade/weather_state.dart';
import 'package:flutter/material.dart';

import 'package:design_patterns_flutter/facade_and_interpreter/facade/humidity_controller.dart';
import 'package:design_patterns_flutter/facade_and_interpreter/facade/season_facade.dart';
import 'package:design_patterns_flutter/facade_and_interpreter/facade/snow_creator.dart';
import 'package:design_patterns_flutter/facade_and_interpreter/facade/temperature_controller.dart';
import 'package:design_patterns_flutter/facade_and_interpreter/interpreter/action.dart';
import 'package:design_patterns_flutter/facade_and_interpreter/interpreter/movement.dart';
import 'package:design_patterns_flutter/facade_and_interpreter/interpreter/rotation.dart';

class SeasonChanger extends StatefulWidget {
  const SeasonChanger({super.key});

  @override
  State<SeasonChanger> createState() => _SeasonChangerState();
}

class _SeasonChangerState extends State<SeasonChanger> {
  final List<Offset> offsets = List<Offset>.generate(25, (index) {
    double x = index % 5 - 2;
    double y = 2.0 - index ~/ 5;
    return Offset(x, y);
  });
  final SeasonFacade facade = SeasonFacade(
    temperatureController: TemperatureController(),
    humidityController: HumidityController(),
    snowCreator: SnowCreator(),
  );

  final WeatherState state = WeatherState();

  Color appBarColor = Colors.white;
  String input = '';
  int currentIndex = -1;
  Offset currentOffset = Offset(0, 0);
  bool isSpring = false;
  bool isSummer = false;
  bool isAutumn = false;
  bool isWinter = false;

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
                    child: currentIndex == index || currentIndex == -1
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
    final List<Motion> actions = [];
    final List<String> inputCharacters = input.split('');
    Offset changedOffset = currentOffset;

    for (String char in inputCharacters) {
      switch (char) {
        case '←':
          {
            actions.add(LeftRotation());
            break;
          }
        case '→':
          {
            actions.add(RightRotation());
            break;
          }
        case '↑':
          {
            actions.add(TopRotation());
            break;
          }
        case '↓':
          {
            actions.add(BottomRotation());
            break;
          }
        default:
          {
            Movement movement =
                Movement(rotation: actions.last, currentOffset: changedOffset);
            actions.add(movement);
            changedOffset = movement.interpret();
            break;
          }
      }
    }

    return changedOffset;
  }
}
