import 'package:flutter/material.dart';
import 'package:r_d_flutter_course/features/navigation/presentation/widgets/navigation_button.dart';

class NamedRoutesNavigationScreen extends StatelessWidget {
  const NamedRoutesNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Named Routes Navigation')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          NavigationButton(
            title: 'Simple transition to new screen',
            onTap: () {
              Navigator.pushNamed(context, '/new_screen');
            },
          ),
          NavigationButton(
            title: 'Simple transition to new screen with data',
            onTap: () {
              Navigator.pushNamed(
                context,
                '/simple_screen_with_data',
                arguments: NamedScreenArgs(id: '666999', name: 'Renat'),
              );
            },
          ),
        ],
      ),
    );
  }
}

class NamedScreenArgs {
  NamedScreenArgs({required this.id, required this.name});

  final String id;
  final String name;
}
