// ignore_for_file: use_colored_box

import 'package:flutter/material.dart';

class UnderstandingConstraintsExample4 extends StatelessWidget {
  const UnderstandingConstraintsExample4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example 4'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: Column(
        spacing: 10,
        children: [
          Row(
            spacing: 10,
            children: [
              Text('In Expanded()'),
              Expanded(
                child: Container(
                  color: Colors.blueAccent,
                  height: 80,
                  width: 80,
                ),
              ),
              Expanded(
                child: Container(
                  height: 80,
                  width: 80,
                  color: Colors.yellow,
                  child: ListView.builder(
                    itemCount: 300,
                    itemBuilder: (context, index) {
                      return Text('Item $index');
                    },
                  ),
                ),
              ),
            ],
          ),
          Row(
            spacing: 10,
            children: [
              Text('In Flexible()'),
              Flexible(
                child: Container(
                  color: Colors.blueAccent,
                  height: 80,
                  width: 80,
                ),
              ),
              Flexible(
                child: Container(
                  height: 80,
                  width: 80,
                  color: Colors.yellow,
                  child: ListView.builder(
                    itemCount: 300,
                    itemBuilder: (context, index) {
                      return Text('Item $index');
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 200,
                width: 150,
                child: ListView(
                  children: [
                    Text('ListView item 1'),
                    Text('ListView item 2'),
                    Text('ListView item 3'),
                    Text('ListView item 4'),
                    Text('ListView item 5'),
                    Text('ListView item 6'),
                    Text('ListView item 7'),
                    Text('ListView item 8'),
                    Text('ListView item 9'),
                    Text('ListView item 10'),
                    Text('ListView item 11'),
                    Text('ListView item 12'),
                    Text('ListView item 13'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// В тебе є Row з одним child - Container.
// 1. Спробуй змінити висоту контейнеру до 4000. Як бачиш помилка вже не має.
// 2. Висоту поверни до початкового значення (100).
// 3. Спробуй змінити ширину контейнеру до 4000. Помилка вже є.
// 4. Обгорни Container в Expanded.
// 5. Поверни ширину контейнеру до значення 100. Щось змінилось?
// 6. Заміни Expanded на Flexible.
// 7. Знов додай ширину 4000
// 8. Подумай в чому різниця між  Expanded і Flexible.
// 9. Поверни ширину контейнеру до початкового значення (100) та видали Flexible
// 10. Під контейнером додай ListView. З двума текстовими віджетами.
// Ось тут я думаю ти думав не буде помилки. Але не так. Подумай як пофіксати.
// Два основних.
// Задати висоту ListView або обгорнути ListView в Expanded/Flexible
