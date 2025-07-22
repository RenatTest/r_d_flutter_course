// ignore_for_file: use_colored_box

import 'package:flutter/material.dart';

class UnderstandingConstraintsExample5 extends StatelessWidget {
  const UnderstandingConstraintsExample5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example 5'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: Column(
        spacing: 10,
        children: [
          Container(
            width: 100,
            height: 100,
            color: Colors.lightGreen,
            child: const Text('Some random text with data '),
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.lightGreen,
            child: FittedBox(child: const Text('Some random text with data ')),
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.greenAccent,
            child: Image.asset('assets/images/like-active.png'),
          ),
          Container(
            width: 100,
            height: 100,
            color: Colors.greenAccent,
            child: FittedBox(
              child: Image.asset('assets/images/like-active.png'),
            ),
          ),
        ],
      ),
    );
  }
}

// В тебе є Container(100x100) в якому є Text.
// Спробуй обгорнути Text в FittedBox. Які зміни відбулися?
// Спробуй змінити ширину контейнеру до 400. Які зміни відбулися?
// Видали FittedBox. Які зміни відбулися?
