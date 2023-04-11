import 'package:design_patterns_flutter/iterator_and_factory_method/factory_method/creator.dart';
import 'package:design_patterns_flutter/iterator_and_factory_method/factory_method/custom_collection.dart';
import 'package:design_patterns_flutter/iterator_and_factory_method/factory_method/custom_stack.dart';

class StackCreator extends Creator {
  final List<int> _list;

  StackCreator(this._list);

  @override
  CustomCollection createCollection() {
    return CustomStack(_list);
  }
}
