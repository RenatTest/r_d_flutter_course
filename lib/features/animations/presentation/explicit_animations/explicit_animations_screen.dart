import 'package:flutter/material.dart';

class ExplicitAnimationsScreen extends StatelessWidget {
  const ExplicitAnimationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explicit Animations'),
        backgroundColor: Colors.green.shade100,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Explicit Animations',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Explicit animations give you full control over the animation '
              'process. You manage the AnimationController and define custom '
              'animations. Examples include:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '• AnimationController\n'
              '• AnimationBuilder\n'
              '• AnimatedBuilder\n'
              '• Custom animations\n'
              '• Tween animations\n'
              '• Curved animations\n'
              '• Staggered animations\n'
              '• Hero animations',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 32),
            Text(
              'Examples will be added here...',
              style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
