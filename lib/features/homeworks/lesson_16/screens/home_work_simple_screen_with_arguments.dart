import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeWorkSimpleScreenWithArguments extends StatelessWidget {
  const HomeWorkSimpleScreenWithArguments({
    required this.name,
    required this.age,
    required this.proffesion,
    required this.salary,
    super.key,
  });

  final String name;
  final String age;
  final String proffesion;
  final String salary;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home work simple screen with arguments'),
      ),
      body: Center(
        child: Column(
          spacing: 10,
          children: [
            Text('Name: $name'),
            Text('Age: $age'),
            Text('Profession: $proffesion'),
            Text('Salary: $salary \$'),
            InkWell(
              onTap: () => context.pop(),
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
