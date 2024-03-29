import 'package:design_patterns_flutter/iterator_and_factory_method/iterator/custom_iterator.dart';

abstract class CustomCollection {
  List<int> getCollection();
  CustomIterator createIterator();
}
