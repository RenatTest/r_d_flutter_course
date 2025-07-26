import 'package:flutter/material.dart';

class HomeWorkNavigationMainScreen extends StatelessWidget {
  const HomeWorkNavigationMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home work navigation main screen')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // NavigationButton(
          //   title: 'Simple transition to new screen',
          //   onTap: () {
          //     Navigator.pushNamed(context, '/new_screen');
          //   },
          // ),
          // NavigationButton(
          //   title: 'Simple transition to new screen with data',
          //   onTap: () {
          //     Navigator.pushNamed(
          //       context,
          //       '/simple_screen_with_data',
          //       arguments: NamedScreenArgs(id: '666999', name: 'Renat'),
          //     );
          //   },
          // ),
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
