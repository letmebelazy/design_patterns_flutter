import 'dart:math';

import 'package:design_patterns_flutter/flyweight_and_chain_of_responsibility/chain_of_responsibilty/handler.dart';
import 'package:design_patterns_flutter/flyweight_and_chain_of_responsibility/chain_of_responsibilty/login_handler.dart';
import 'package:design_patterns_flutter/flyweight_and_chain_of_responsibility/chain_of_responsibilty/max_handler.dart';
import 'package:design_patterns_flutter/flyweight_and_chain_of_responsibility/chain_of_responsibilty/push_handler.dart';
import 'package:design_patterns_flutter/flyweight_and_chain_of_responsibility/flyweight/lawn.dart';
import 'package:design_patterns_flutter/flyweight_and_chain_of_responsibility/flyweight/lawn_factory.dart';
import 'package:flutter/material.dart';

class GithubLawns extends StatefulWidget {
  const GithubLawns({super.key});

  @override
  State<GithubLawns> createState() => _GithubLawnsState();
}

class _GithubLawnsState extends State<GithubLawns> {
  final LawnFactory lawnFactory = LawnFactory();
  final Random random = Random();
  List<Lawn> lawns = [];

  @override
  void initState() {
    super.initState();

    makeRandomLawns();
  }

  void makeRandomLawns() {
    lawns.clear();
    lawnFactory.lawns.clear();

    for (int i = 0; i < 70; i++) {
      final randomNumber = random.nextInt(5);
      final lawn = lawnFactory.getLawn(randomNumber);
      lawns.add(lawn);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('깃헙 랜덤 잔디심기'),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: makeRandomLawns,
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.black87,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  mainAxisSpacing: 1.0,
                  crossAxisSpacing: 1.0,
                ),
                itemCount: 70,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      switch (lawns[index].commitCount) {
                        case 0:
                          {
                            Handler handler = LoginHandler(null);

                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text(
                                  handler.execute(lawns[index].commitCount),
                                ),
                              ),
                            );
                            break;
                          }
                        case 1:
                          {
                            Handler handler2 = PushHandler(null);
                            Handler handler = LoginHandler(handler2);

                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text(
                                  handler.execute(lawns[index].commitCount),
                                ),
                              ),
                            );
                            break;
                          }
                        case 2:
                          {
                            Handler handler2 = PushHandler(null);
                            Handler handler = LoginHandler(handler2);

                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text(
                                  handler.execute(lawns[index].commitCount),
                                ),
                              ),
                            );
                            break;
                          }
                        case 3:
                          {
                            Handler handler2 = PushHandler(null);
                            Handler handler = LoginHandler(handler2);

                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text(
                                  handler.execute(lawns[index].commitCount),
                                ),
                              ),
                            );
                            break;
                          }
                        default:
                          {
                            Handler handler3 = MaxHandler(null);
                            Handler handler2 = PushHandler(handler3);
                            Handler handler = LoginHandler(handler2);

                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text(
                                  handler.execute(lawns[index].commitCount),
                                ),
                              ),
                            );
                            break;
                          }
                      }
                    },
                    child: Container(
                      color: lawns[index].getColor(),
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            color: Colors.black,
            child: Text(
              '사용된 잔디 객체 개수:\n${lawnFactory.lawns.length}',
              style: TextStyle(color: Colors.white),
              textScaleFactor: 3.0,
            ),
          ),
          Container(
            height: 200.0,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
