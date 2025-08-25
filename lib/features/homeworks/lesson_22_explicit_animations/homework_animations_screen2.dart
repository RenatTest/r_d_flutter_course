import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

enum Move { up, down, left, right, none }

class Homework22Screen2 extends StatefulWidget {
  const Homework22Screen2({super.key});

  @override
  State<Homework22Screen2> createState() => _Homework22Screen2State();
}

class _Homework22Screen2State extends State<Homework22Screen2>
    with SingleTickerProviderStateMixin {
  late AnimationController _ballController;
  late Alignment _ballAlignment = Alignment.center;
  late Move _currentDirection = Move.none;
  static const step = 0.01;

  @override
  void initState() {
    _ballController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _ballController.addListener(() {
      switch (_currentDirection) {
        case Move.up:
          _ballAlignment = Alignment(_ballAlignment.x, _ballAlignment.y - step);
        case Move.down:
          _ballAlignment = Alignment(_ballAlignment.x, _ballAlignment.y + step);
        case Move.left:
          _ballAlignment = Alignment(
            _ballAlignment.x - step * 1.5,
            _ballAlignment.y,
          );
        case Move.right:
          _ballAlignment = Alignment(
            _ballAlignment.x + step * 1.5,
            _ballAlignment.y,
          );
        case Move.none:
          break;
      }

      _ballAlignment = Alignment(
        _ballAlignment.x.clamp(-1.0, 1.0),
        _ballAlignment.y.clamp(-1.0, 1.0),
      );
    });

    super.initState();
  }

  @override
  void dispose() {
    _ballController.dispose();
    super.dispose();
  }

  void _startMoving(Move direction) {
    _currentDirection = direction;
    _ballController.repeat(period: const Duration(milliseconds: 20));
  }

  void _stopMoving() {
    _currentDirection = Move.none;
    _ballController.stop();
  }

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
            child: AnimatedBuilder(
              animation: _ballController,
              builder: (context, child) {
                return Align(
                  alignment: _ballAlignment,
                  child: Image.asset(
                    width: 50,
                    height: 50,
                    'assets/images/ball.png',
                  ),
                );
              },
            ),
          ),
          Positioned(
            bottom: 20,
            left: MediaQuery.of(context).size.width / 2 - 100,
            child: Column(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Button(
                  text: '↑',
                  direction: Move.up,
                  startMoving: _startMoving,
                  stopMoving: _stopMoving,
                ),
                Row(
                  spacing: 10,
                  children: [
                    Button(
                      text: '←',
                      direction: Move.left,
                      startMoving: _startMoving,
                      stopMoving: _stopMoving,
                    ),
                    Button(
                      text: '↓',
                      direction: Move.down,
                      startMoving: _startMoving,
                      stopMoving: _stopMoving,
                    ),
                    Button(
                      text: '→',
                      direction: Move.right,
                      startMoving: _startMoving,
                      stopMoving: _stopMoving,
                    ),
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
  const Button({
    required this.text,
    required this.direction,
    required this.startMoving,
    required this.stopMoving,
    super.key,
  });

  final String text;
  final Move direction;
  final void Function(Move) startMoving;
  final VoidCallback stopMoving;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => startMoving(direction),
      onTapUp: (_) => stopMoving(),
      onTapCancel: stopMoving,
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: Colors.redAccent,
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
