import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
            onTap: () => context.go('/navigation/named-routes/simple-empty'),
          ),
          NavigationButton(
            title: 'Simple transition to new screen with data',
            onTap: () =>
                context.go('/navigation/named-routes/simple-with-data/666999'),
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
