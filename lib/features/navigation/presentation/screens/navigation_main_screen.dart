import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:r_d_flutter_course/features/app/screens/page_names.dart';
import 'package:r_d_flutter_course/features/widgets/presentation/screens/widgets_main_screen.dart';

class NavigationMainScreen extends StatelessWidget {
  const NavigationMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Navigation')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          NavigationCard(
            title: 'Base Navigation Section',
            description: '',
            onTap: () => context.goNamed(ScreenNames.baseNavigation),
          ),
          NavigationCard(
            title: 'Navigation with named routes',
            description: '',
            onTap: () => context.goNamed(ScreenNames.namedRoutesNavigation),
          ),
          NavigationCard(
            title: 'Homework_16',
            description: '',
            onTap: () => context.goNamed(ScreenNames.homework16),
          ),
        ],
      ),
    );
  }
}
