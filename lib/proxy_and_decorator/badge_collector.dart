import 'package:design_patterns_flutter/proxy_and_decorator/decorator/trainer.dart';
import 'package:design_patterns_flutter/proxy_and_decorator/decorator/trainer_with_badge.dart';
import 'package:design_patterns_flutter/proxy_and_decorator/decorator/trainer_with_no_badge.dart';
import 'package:design_patterns_flutter/proxy_and_decorator/gym.dart';
import 'package:flutter/material.dart';

class BadgeCollector extends StatefulWidget {
  BadgeCollector({super.key});

  @override
  State<BadgeCollector> createState() => _BadgeCollectorState();
}

class _BadgeCollectorState extends State<BadgeCollector> {
  Trainer trainer = TrainerWithNoBadge();
  bool isBadgeShown = false;

  final List<String> badgeColors = [
    'grey',
    'blue',
    'yellow',
    'rainbow',
    'purple',
    'brown',
    'red',
    'green'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 200,
          ),
          Expanded(
            child: GridView.builder(
              itemCount: 9,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (context, index) {
                if (index == 4) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        isBadgeShown = !isBadgeShown;
                      });
                    },
                    child: Container(
                      color: Colors.amber.shade100,
                      child: Image.asset(
                        'assets/satoshi.png',
                      ),
                    ),
                  );
                }

                final int realIndex;
                if (index > 4) {
                  realIndex = index - 1;
                } else {
                  realIndex = index;
                }

                return GestureDetector(
                  onTap: () async {
                    final String color =
                        await Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => Gym(
                                  color: badgeColors[realIndex],
                                )));
                    setState(() {
                      trainer = TrainerWithBadge(color, trainer);
                      print(trainer.collectBadge());
                    });
                  },
                  child: isBadgeShown &&
                          trainer
                              .collectBadge()
                              .contains(badgeColors[realIndex])
                      ? Container(
                          width: 20,
                          height: 20,
                          color: Colors.amber,
                        )
                      : Image.asset('assets/${badgeColors[realIndex]}.png'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
