import 'package:design_patterns_flutter/iterator_and_factory_method/factory_method/custom_collection.dart';
import 'package:design_patterns_flutter/iterator_and_factory_method/factory_method/custom_queue.dart';

abstract class Creator {
  CustomCollection create() {
    CustomCollection collection = createCollection();

    return collection;
  }

  CustomCollection createCollection();
}
