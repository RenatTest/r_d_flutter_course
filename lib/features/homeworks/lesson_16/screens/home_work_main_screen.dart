import 'package:flutter/material.dart';
import 'package:r_d_flutter_course/features/navigation/presentation/widgets/navigation_button.dart';

class HomeWorkNavigationMainScreen extends StatelessWidget {
  const HomeWorkNavigationMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home work navigation main screen')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          NavigationButton(
            title: 'Simple transition to new screen',
            onTap: () {
              Navigator.pushNamed(context, '/home_work_simple_screen');
            },
          ),
          NavigationButton(
            title: 'Simple transition to new screen with data',
            onTap: () {
              Navigator.pushNamed(
                context,
                '/home_work_simple_screen_with_arguments',
                arguments: Arguments(
                  name: 'Renat',
                  age: 39,
                  profession: 'Flutter dev',
                  salary: 7000,
                ),
              );
            },
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
