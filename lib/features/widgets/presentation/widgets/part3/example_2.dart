// ignore_for_file: use_colored_box

import 'package:flutter/material.dart';

class UnderstandingConstraintsExample2 extends StatelessWidget {
  const UnderstandingConstraintsExample2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example 2'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: Container(
        color: Colors.green,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              // print('maxWidth: ${constraints.maxWidth}');
              // print('maxHeight: ${constraints.maxHeight}');
              // print('minWidth: ${constraints.minWidth}');
              // print('minHeight: ${constraints.minHeight}');

              return Container(color: Colors.orange, height: 200, width: 200);
            },
          ),
        ),
      ),
    );
  }
}

// 1. При початковому стані зелений контейнер не видно.
// Бо якщо ви не задали розмір зеленому контейнеру, то він займає розмір
// свого child віджету, якщо в нього є розміри.
// 2. Додайте padding (12) дo помарачевого контейнеру. Зелений контейнер
// тепер має розмір child віджету + padding.
// 3. Збільшуйте поступово padding до 100 - зверніть увагу як зміниться розмір
// помарачевого контейнеру. (За допомогою LayoutBuilder подивіться, які
// constraints приходять в помаранчевий контейнер)
