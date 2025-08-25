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
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _animation = TweenSequence([
      TweenSequenceItem(tween: Tween<double>(begin: 0, end: 111), weight: 0.3),
      TweenSequenceItem(
        tween: Tween<double>(begin: 111, end: 222),
        weight: 0.7,
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
            return Container(
              color: Colors.deepOrangeAccent,
              height: _animation.value,
              width: _animation.value,
              child: Center(
                child: Text(
                  _animation.value.toStringAsFixed(2),
                  style: const TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
