// ignore_for_file: inference_failure_on_instance_creation

import 'package:flutter/material.dart';
import 'package:r_d_flutter_course/features/navigation/presentation/widgets/navigation_button.dart';

class HomeWork16Screen extends StatelessWidget {
  const HomeWork16Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home work navigation main screen')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          NavigationButton(
            title: 'Simple transition to new screen',
            onTap: () {},
          ),
          NavigationButton(
            title: 'Simple transition to new screen with data',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class Arguments {
  Arguments({
    required this.name,
    required this.age,
    required this.profession,
    required this.salary,
  });

  final String name;
  final int age;
  final String profession;
  final double salary;
}
