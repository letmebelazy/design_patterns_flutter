import 'package:design_patterns_flutter/iterator_and_factory_method/factory_method/custom_collection.dart';
import 'package:design_patterns_flutter/iterator_and_factory_method/iterator/custom_iterator.dart';
import 'package:design_patterns_flutter/iterator_and_factory_method/iterator/queue_iterator.dart';

class CustomQueue implements CustomCollection {
  final List<int> _list;

  CustomQueue(this._list);

  @override
  List<int> getCollection() {
    return _list;
  }

  @override
  CustomIterator createIterator() {
    return QueueIterator(collection: this);
  }
}
