import 'package:flutter/material.dart';

class HomeWorkSimpleScreen extends StatelessWidget {
  const HomeWorkSimpleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home work simple screen')),
      body: Center(
        child: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            height: 50,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.green,
            ),
            child: const Center(
              child: Text('Go back', style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
      ),
    );
  }
}
