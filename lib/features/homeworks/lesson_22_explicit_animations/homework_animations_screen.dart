import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Homework22Screen extends StatefulWidget {
  const Homework22Screen({super.key});

  @override
  State<Homework22Screen> createState() => _Homework22ScreenState();
}

class _Homework22ScreenState extends State<Homework22Screen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late final Animation<Alignment> _alignmentAnimation;
  late final Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _alignmentAnimation = TweenSequence([
      TweenSequenceItem(
        tween: AlignmentTween(
          begin: Alignment.bottomCenter,
          end: const Alignment(0, -0.95),
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 3.5,
      ),
      TweenSequenceItem(
        tween: AlignmentTween(
          begin: const Alignment(0, -0.95),
          end: const Alignment(0, -0.95),
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 1.75,
      ),
      TweenSequenceItem(
        tween: AlignmentTween(
          begin: const Alignment(0, -0.95),
          end: Alignment.bottomCenter,
        ).chain(CurveTween(curve: Curves.easeIn)),
        weight: 3.5,
      ),
      TweenSequenceItem(
        tween: AlignmentTween(
          begin: Alignment.bottomCenter,
          end: const Alignment(0, 0.6),
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 2,
      ),
      TweenSequenceItem(
        tween: AlignmentTween(
          begin: const Alignment(0, 0.6),
          end: Alignment.bottomCenter,
        ).chain(CurveTween(curve: Curves.easeIn)),
        weight: 2.2,
      ),
      TweenSequenceItem(
        tween: AlignmentTween(
          begin: Alignment.bottomCenter,
          end: const Alignment(0, 0.85),
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 1.5,
      ),
      TweenSequenceItem(
        tween: AlignmentTween(
          begin: const Alignment(0, 0.85),
          end: Alignment.bottomCenter,
        ).chain(CurveTween(curve: Curves.easeIn)),
        weight: 1.53,
      ),
    ]).animate(_controller);

    _rotationAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween<double>(begin: 0.0, end: 0.6), weight: 2),
      TweenSequenceItem(tween: Tween<double>(begin: 0.6, end: 1.0), weight: 2),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.25, end: 1.45),
        weight: 2,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.45, end: 1.65),
        weight: 1,
      ),
      TweenSequenceItem(tween: Tween<double>(begin: 1.65, end: 1.8), weight: 1),
    ]).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _move() {
    _controller.forward(from: 0);
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
