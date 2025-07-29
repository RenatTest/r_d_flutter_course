import 'package:flutter/material.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_16/screens/home_work_16_screen.dart';

class HomeWorkSimpleScreenWithArguments extends StatelessWidget {
  const HomeWorkSimpleScreenWithArguments({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments! as Arguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home work simple screen with arguments'),
      ),
      body: Center(
        child: Column(
          spacing: 10,
          children: [
            Text('Name: ${args.name}'),
            Text('Age: ${args.age}'),
            Text('Profession: ${args.profession}'),
            Text('Salary: ${args.salary} \$'),
            InkWell(
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
          ],
        ),
      ),
    );
  }
}
