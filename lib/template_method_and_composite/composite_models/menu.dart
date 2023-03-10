import 'package:flutter/material.dart';

abstract class Menu extends StatelessWidget {
  final int depthCount;

  Menu({required this.depthCount});

  // StatelessWidget 필수 오버라이드 메서드인 build를 그대로 필요로 함
  // 사실상 아래와 같이 추상 메서드가 있는 것과 다름 없음
  // Widget build(BuildContext context);
}
