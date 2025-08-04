import 'package:flutter/material.dart';
import 'package:r_d_flutter_course/features/state_managment/simple_example.dart/simple_example.dart';

class SimpleStateManagementScreen extends StatelessWidget {
  const SimpleStateManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple State Management'),
        backgroundColor: Colors.green.shade100,
      ),
      body: const CounterScreen(),
    );
  }
}
