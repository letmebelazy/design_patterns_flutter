import 'package:design_patterns_flutter/iterator_and_factory_method/factory_method/custom_collection.dart';
import 'package:design_patterns_flutter/iterator_and_factory_method/iterator/custom_iterator.dart';

class StackIterator implements CustomIterator {
  final CustomCollection collection;
  late List<int> container;

  StackIterator({required this.collection}) {
    container = collection.getCollection();
  }

  @override
  bool hasNext() {
    return container.length != 0;
  }

  @override
  int? getNext() {
    if (hasNext()) {
      return container.removeLast();
    }
    return null;
  }

  @override
  List getContainer() {
    return container;
  }
}
