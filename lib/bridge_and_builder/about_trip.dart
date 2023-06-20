import 'package:design_patterns_flutter/bridge_and_builder/bridge/long_explanation.dart';
import 'package:flutter/material.dart';

import 'package:design_patterns_flutter/bridge_and_builder/bridge/short_explanation.dart';
import 'package:design_patterns_flutter/bridge_and_builder/bridge/trip_explanation.dart';
import 'package:design_patterns_flutter/bridge_and_builder/builder/itenerary.dart';
import 'package:design_patterns_flutter/bridge_and_builder/builder/itenerary_builder.dart';
import 'package:design_patterns_flutter/bridge_and_builder/builder/normal_trip_builder.dart';
import 'package:design_patterns_flutter/bridge_and_builder/builder/poor_trip_builder.dart';
import 'package:design_patterns_flutter/bridge_and_builder/builder/rich_trip_builder.dart';
import 'package:design_patterns_flutter/bridge_and_builder/builder/trip_manager.dart';

class AboutTrip extends StatefulWidget {
  const AboutTrip({super.key});

  @override
  State<AboutTrip> createState() => _AboutTripState();
}

class _AboutTripState extends State<AboutTrip> {
  late Itenerary itenerary;
  late IteneraryBuilder builder;
  late TripManager manager;
  late TripExplanation explanation;

  @override
  void initState() {
    super.initState();

    itenerary = Itenerary(level: '중류층');
    builder = NormalTripBuilder(itenerary: itenerary);
    manager = TripManager(builder);
    explanation = ShortExplanation();

    manager.buildTrip();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: 200.0,
            height: 300.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          itenerary = Itenerary(level: '상류층');
                          builder = RichTripBuilder(itenerary: itenerary);
                          manager.changeBuilder(builder);
                          manager.buildTrip();
                        });
                      },
                      child: Text('상류층'),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          itenerary = Itenerary(level: '중류층');
                          builder = NormalTripBuilder(itenerary: itenerary);
                          manager.changeBuilder(builder);
                          manager.buildTrip();
                        });
                      },
                      child: Text('중류층'),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          itenerary = Itenerary(level: '하류층');
                          builder = PoorTripBuilder(itenerary: itenerary);
                          manager.changeBuilder(builder);
                          manager.buildTrip();
                        });
                      },
                      child: Text('하류층'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        setState(() {
                          explanation = ShortExplanation();
                        });
                      },
                      child: Text('짧게 보기'),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        setState(() {
                          explanation = LongExplanation();
                        });
                      },
                      child: Text('길게 보기'),
                    ),
                  ],
                ),
                Text(
                  itenerary.explain(explanation),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
