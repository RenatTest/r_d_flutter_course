// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class TweenAndAnimationExample extends StatefulWidget {
  const TweenAndAnimationExample({super.key});

  @override
  State<TweenAndAnimationExample> createState() =>
      _TweenAndAnimationExampleState();
}

// Розказати про відмінність AnimationController та Animation та Tween
// Розказати про addListener та addStatusListener
// Розказати про створення Animation

class _TweenAndAnimationExampleState extends State<TweenAndAnimationExample>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Alignment> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _animation = TweenSequence([
      TweenSequenceItem(
        tween: AlignmentTween(
          begin: Alignment.topLeft,
          end: Alignment.topRight,
        ),
        weight: 0.25,
      ),
      TweenSequenceItem(
        tween: AlignmentTween(
          begin: Alignment.topRight,
          end: Alignment.bottomRight,
        ),
        weight: 0.25,
      ),
      TweenSequenceItem(
        tween: AlignmentTween(
          begin: Alignment.bottomRight,
          end: Alignment.bottomLeft,
        ),
        weight: 0.25,
      ),
      TweenSequenceItem(
        tween: AlignmentTween(
          begin: Alignment.bottomLeft,
          end: Alignment.topLeft,
        ),
        weight: 0.25,
      ),
    ]).animate(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tween + Animation')),
      body: Center(
        child: AnimatedBuilder(
          // ListenableBuilder
          animation: _animation,
          builder: (context, child) {
            return Align(
              alignment: _animation.value,
              child: GestureDetector(
                onTap: () {
                  _controller.forward(from: 0);
                },
                child: Container(
                  color: Colors.deepOrangeAccent,
                  height: 88,
                  width: 88,
                  child: Center(
                    child: Text(
                      _animation.value.toString(),
                      style: const TextStyle(fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
