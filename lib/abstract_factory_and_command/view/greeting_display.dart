import 'package:flutter/material.dart';

import 'package:design_patterns_flutter/abstract_factory_and_command/abstract_factory/greeting.dart';
import 'package:design_patterns_flutter/abstract_factory_and_command/abstract_factory/greeting_factory.dart';
import 'package:design_patterns_flutter/abstract_factory_and_command/command/command.dart';

class GreetingDisplay extends StatefulWidget {
  const GreetingDisplay({super.key});

  @override
  State<GreetingDisplay> createState() => _GreetingDisplayState();
}

class _GreetingDisplayState extends State<GreetingDisplay> {
  // 뷰 위젯이 클라이언트가 됨
  final List<Command> commands = [];
  int languageIndex = -1;
  int greetingIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('인사를 알아봅시다'),
        backgroundColor: Colors.purple,
      ),
      body: SizedBox(
        height: double.infinity,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      languageIndex = 0;
                    });
                  },
                  child: Text(
                    '한국어',
                    style: TextStyle(
                      color: languageIndex == 0 ? Colors.black : Colors.grey,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      languageIndex = 1;
                    });
                  },
                  child: Text(
                    'English',
                    style: TextStyle(
                      color: languageIndex == 1 ? Colors.black : Colors.grey,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      languageIndex = 2;
                    });
                  },
                  child: Text(
                    '日本語',
                    style: TextStyle(
                      color: languageIndex == 2 ? Colors.black : Colors.grey,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      greetingIndex = 0;
                    });
                  },
                  child: Text(
                    '만났을 때',
                    style: TextStyle(
                      color: greetingIndex == 0 ? Colors.black : Colors.grey,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      greetingIndex = 1;
                    });
                  },
                  child: Text(
                    '헤어질 때',
                    style: TextStyle(
                      color: greetingIndex == 1 ? Colors.black : Colors.grey,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            ),
            OutlinedButton(
              onPressed: () {
                if (languageIndex == -1 || greetingIndex == -1) {
                  return;
                }

                GreetingFactory factory;
                Greeting greeting;
                Command command;

                switch (languageIndex) {
                  case 0:
                    {
                      factory = KoreanGreetingFactory();
                      if (greetingIndex == 0) {
                        greeting = factory.createMeetingGreeting();
                      } else {
                        greeting = factory.createFarewellGreeting();
                      }
                      break;
                    }
                  case 1:
                    {
                      factory = EnglishGreetingFactory();
                      if (greetingIndex == 0) {
                        greeting = factory.createMeetingGreeting();
                      } else {
                        greeting = factory.createFarewellGreeting();
                      }
                      break;
                    }
                  default:
                    {
                      factory = JapaneseGreetingFactory();
                      if (greetingIndex == 0) {
                        greeting = factory.createMeetingGreeting();
                      } else {
                        greeting = factory.createFarewellGreeting();
                      }
                      break;
                    }
                }

                switch (commands.length % 3) {
                  case 0:
                    {
                      command = BlueCommand(greeting: greeting);
                      setState(() {
                        commands.add(command);
                      });
                      break;
                    }
                  case 1:
                    {
                      command = RedCommand(greeting: greeting);
                      setState(() {
                        commands.add(command);
                      });
                      break;
                    }
                  default:
                    {
                      command = GreenCommand(greeting: greeting);
                      setState(() {
                        commands.add(command);
                      });
                      break;
                    }
                }
              },
              child: Text(
                '생성',
                style: TextStyle(color: Colors.purple),
              ),
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: ListView.builder(
                itemCount: commands.length,
                itemBuilder: (context, index) {
                  // 리스트뷰 빌더가 사실상 인보커의 역할
                  return Center(child: commands[index].execute());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
