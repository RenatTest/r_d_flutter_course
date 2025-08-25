import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

enum Move { up, down, left, right }

class Homework22Screen2 extends StatefulWidget {
  const Homework22Screen2({super.key});

  @override
  State<Homework22Screen2> createState() => _Homework22Screen2State();
}

class _Homework22Screen2State extends State<Homework22Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Ball'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: HexColor('#90cdfa'),
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(
                width: 50,
                height: 50,
                'assets/images/ball.png',
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: MediaQuery.of(context).size.width / 2 - 100,
            child: Column(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Button(text: '↑', direction: Move.up),
                Row(
                  spacing: 10,
                  children: [
                    Button(text: '←', direction: Move.left),
                    Button(text: '↓', direction: Move.down),
                    Button(text: '→', direction: Move.right),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Button extends StatelessWidget {
  const Button({required this.text, required this.direction, super.key});

  final String text;
  final Move direction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: null,
      onTapUp: null,
      onTapCancel: null,
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: Colors.deepOrange,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
      ),
    );
  }
}
