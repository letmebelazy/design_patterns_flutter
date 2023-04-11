import 'package:design_patterns_flutter/iterator_and_factory_method/factory_method/creator.dart';
import 'package:design_patterns_flutter/iterator_and_factory_method/factory_method/custom_collection.dart';
import 'package:design_patterns_flutter/iterator_and_factory_method/factory_method/queue_creator.dart';
import 'package:design_patterns_flutter/iterator_and_factory_method/factory_method/stack_creator.dart';
import 'package:flutter/material.dart';

class CollectionComparison extends StatefulWidget {
  const CollectionComparison({super.key});

  @override
  State<CollectionComparison> createState() => _CollectionComparisonState();
}

class _CollectionComparisonState extends State<CollectionComparison> {
  List<int> numberList = [1, 2, 3, 4, 5];
  List<int> tempList = [];
  List<int> resultList = [];
  int selectedButtonIndex = -1;
  CustomCollection? collection;
  Creator? creator;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 80.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: numberList
                    .map(
                      (e) => NumberBallSelector(
                        number: e,
                        color: Colors.teal,
                        onTap: () {
                          setState(() {
                            tempList.add(e);
                            numberList.remove(e);
                          });
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
            Text(
              tempList.isEmpty ? '숫자를 선택하시면...' : '누른 순서대로 배치됩니다',
              style: TextStyle(
                fontSize: 30.0,
              ),
            ),
            SizedBox(
              height: 80.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: tempList
                    .map(
                      (e) => NumberBallSelector(
                        number: e,
                        color: Colors.blue,
                      ),
                    )
                    .toList(),
              ),
            ),
            SizedBox(
              height: 80.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedButtonIndex = 0;

                        creator = QueueCreator(tempList);
                        collection = creator!.create();
                      });
                      final iterator = collection!.createIterator();

                      for (int i = 0; i < 5; i++) {
                        if (iterator.hasNext()) {
                          resultList.add(iterator.getNext()!);
                        } else {
                          break;
                        }
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: selectedButtonIndex == 0
                            ? Border.all(color: Colors.blue, width: 4.0)
                            : Border.all(color: Colors.blue),
                      ),
                      child: Text(
                        '큐',
                        style: TextStyle(
                          fontSize: 24.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.0),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedButtonIndex = 1;

                        creator = StackCreator(tempList);
                        collection = creator!.create();
                      });
                      final iterator = collection!.createIterator();

                      for (int i = 0; i < 5; i++) {
                        if (iterator.hasNext()) {
                          resultList.add(iterator.getNext()!);
                        } else {
                          break;
                        }
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: selectedButtonIndex == 1
                            ? Border.all(color: Colors.blue, width: 4.0)
                            : Border.all(color: Colors.blue),
                      ),
                      child: Text(
                        '스택',
                        style: TextStyle(
                          fontSize: 24.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: resultList
                  .map(
                    (e) => NumberBallSelector(
                      number: e,
                      color: Colors.red,
                    ),
                  )
                  .toList(),
            ),
            if (resultList.isNotEmpty)
              TextButton(
                onPressed: () {
                  setState(() {
                    numberList = [1, 2, 3, 4, 5];
                    tempList = [];
                    resultList = [];
                    selectedButtonIndex = -1;
                    collection = null;
                    creator = null;
                  });
                },
                child: Text(
                  '다시 하기',
                  textScaleFactor: 2.0,
                ),
              )
          ],
        ),
      ),
    );
  }
}

class NumberBallSelector extends StatelessWidget {
  final int number;
  final Color color;
  final VoidCallback? onTap;

  const NumberBallSelector({
    super.key,
    required this.number,
    required this.color,
    this.onTap = null,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: color,
        radius: 20.0,
        child: Text(
          '$number',
        ),
      ),
    );
  }
}
