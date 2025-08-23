import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Homework22Screen extends StatefulWidget {
  const Homework22Screen({super.key});

  @override
  State<Homework22Screen> createState() => _Homework22ScreenState();
}

class _Homework22ScreenState extends State<Homework22Screen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late final Animation<Alignment> _alignmentAnimation;
  late final Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(
          duration: const Duration(milliseconds: 700),
          vsync: this,
        )..addListener(() {
          if (_controller.status == AnimationStatus.completed) {
            _move2();
          }
        });

    _alignmentAnimation = AlignmentTween(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
    ).animate(_controller);

    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _move() {
    _controller.forward();
  }

  void _move2() {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Ball'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Flexible(
            flex: 9,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: HexColor('#90cdfa'),
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: _move,
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) => Align(
                    alignment: _alignmentAnimation.value,
                    child: RotationTransition(
                      turns: _rotationAnimation,
                      child: Image.asset(
                        width: 85,
                        height: 85,
                        'assets/images/ball.png',
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    HexColor('#96ca9b'),
                    HexColor('#629e65'),
                    HexColor('#3c7c41'),
                    HexColor('#347636'),
                    HexColor('#236a27'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
