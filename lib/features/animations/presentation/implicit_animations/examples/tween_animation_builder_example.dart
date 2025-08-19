import 'package:flutter/material.dart';

class TweenAnimationBuilderExample extends StatefulWidget {
  const TweenAnimationBuilderExample({super.key});

  @override
  State<TweenAnimationBuilderExample> createState() =>
      _TweenAnimationBuilderExampleState();
}

class _TweenAnimationBuilderExampleState
    extends State<TweenAnimationBuilderExample> {
  double _targetSize = 100.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TweenAnimationBuilder Example'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: Center(
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: _targetSize),
          duration: const Duration(seconds: 2),
          onEnd: () {
            setState(() {
              _targetSize = _targetSize == 100.0 ? 50.0 : 100.0;
            });
          },
          builder: (context, value, child) =>
              Icon(Icons.favorite, color: Colors.red, size: value),
          // Text(
          //   'RD',
          //   style: TextStyle(color: Colors.black, fontSize: value),
          // ),
        ),
      ),
    );
  }
}
