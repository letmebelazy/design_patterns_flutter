import 'package:design_patterns_flutter/iterator_and_factory_method/factory_method/custom_collection.dart';
import 'package:design_patterns_flutter/iterator_and_factory_method/iterator/custom_iterator.dart';

class QueueIterator implements CustomIterator {
  final CustomCollection collection;
  late List<int> container;

  QueueIterator({required this.collection}) {
    container = collection.getCollection();
  }

  @override
  bool hasNext() {
    return container.length != 0;
  }

  @override
  int? getNext() {
    if (hasNext()) {
      return container.removeAt(0);
    }
    return null;
  }
}
