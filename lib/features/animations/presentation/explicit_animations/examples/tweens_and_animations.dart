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
  final _tween = Tween<double>(begin: 0, end: 100);
  final _tweenColor = ColorTween(begin: Colors.blue, end: Colors.redAccent);

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );

    // ignore: avoid_single_cascade_in_expression_statements
    _controller..addListener(() {
      setState(() {});
    });

    // ignore: cascade_invocations, unnecessary_lambdas
    _controller.addStatusListener((status) {
      print(status);
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      }
    });

    // ignore: cascade_invocations
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
        child: Container(
          color: _tweenColor.transform(_controller.value),
          width: _tween.transform(_controller.value),
          height: _tween.transform(_controller.value),
          alignment: Alignment.center,
          child: Text(
            'Container text',
            style: const TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
