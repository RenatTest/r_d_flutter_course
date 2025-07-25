// ignore_for_file: use_colored_box

import 'package:flutter/material.dart';

class UnderstandingConstraintsExample1 extends StatelessWidget {
  const UnderstandingConstraintsExample1({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 300,
        width: 300,
        color: Colors.red,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: 100,
            width: 100,
            color: Colors.green,
            child: Text('Text inside container'), // text overflow
          ),
        ),
      ),
    );
  }
}

// 1. Змініть ширину та висоту контейнера(100 на 100). Чому це не працює?
// 2. Типове рішення — Center або інший віджет, який не має мінімальних обмежень
// 3. Як можливо перевірити обмеження — LayoutBuilder. Ця просто для розуміння
// 4. Задати double.imfinity для висоти - потім для ширини.

// Додатково:
// Якщо в початковому прикладі додати в контейнер Text, то ми бачимо жовту
// лінію під текстом. Чому так?
