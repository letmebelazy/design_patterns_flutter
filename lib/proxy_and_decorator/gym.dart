import 'package:design_patterns_flutter/proxy_and_decorator/proxy/boss_proxy.dart';
import 'package:flutter/material.dart';

class Gym extends StatefulWidget {
  final String color;
  const Gym({super.key, required this.color});

  @override
  State<Gym> createState() => _GymState();
}

class _GymState extends State<Gym> {
  late final BossProxy proxy;

  @override
  void initState() {
    proxy = BossProxy(badgeColor: widget.color);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: proxy.giveBadge() == ''
            ? Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.grey.shade200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 200.0,
                      child: Image.asset('assets/trainer.png'),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        setState(() {});
                      },
                      child: Text('싸운다'),
                    )
                  ],
                ),
              )
            : Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.red.shade400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 200.0,
                      child: Image.asset('assets/${widget.color}.png'),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context, widget.color);
                      },
                      child: Text(
                        '이겼다\n뱃지를 받았다',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
