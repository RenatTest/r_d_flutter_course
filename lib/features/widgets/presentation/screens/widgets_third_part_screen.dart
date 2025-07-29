import 'package:flutter/material.dart';
import 'package:r_d_flutter_course/features/widgets/presentation/screens/widgets_first_part_screen.dart';

class WidgetsThirdPartScreen extends StatelessWidget {
  const WidgetsThirdPartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Understanding constraints'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          WidgetExampleCard(
            title: 'Example 1',
            description: 'Examples with Container',
            onTap: () {},
          ),
          WidgetExampleCard(
            title: 'Example 2',
            description: 'Another example case with Container',
            onTap: () {},
          ),
          WidgetExampleCard(
            title: 'Example 3',
            description: 'Examples with Column',
            onTap: () {},
          ),
          WidgetExampleCard(
            title: 'Example 4',
            description: 'Examples with Row',
            onTap: () {},
          ),
          WidgetExampleCard(
            title: 'Example 5',
            description: 'FittedBox example',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
