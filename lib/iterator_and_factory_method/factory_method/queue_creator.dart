import 'package:design_patterns_flutter/iterator_and_factory_method/factory_method/creator.dart';
import 'package:design_patterns_flutter/iterator_and_factory_method/factory_method/custom_collection.dart';
import 'package:design_patterns_flutter/iterator_and_factory_method/factory_method/custom_queue.dart';

class QueueCreator extends Creator {
  final List<int> _list;

  QueueCreator(this._list);

  @override
  CustomCollection createCollection() {
    return CustomQueue(_list);
  }
}
