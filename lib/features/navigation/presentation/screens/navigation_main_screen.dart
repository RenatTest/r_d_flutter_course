import 'package:flutter/material.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_16/screens/home_work_main_screen.dart';
import 'package:r_d_flutter_course/features/navigation/presentation/screens/base_navigation/base_navigation_section_screen.dart';
import 'package:r_d_flutter_course/features/navigation/presentation/screens/named_navigation/named_routes_navigation.dart';
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
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute<Widget>(
                builder: (context) => const BaseNavigationSectionScreen(),
              ),
            ),
          ),
          NavigationCard(
            title: 'Navigation with named routes',
            description: '',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute<Widget>(
                builder: (context) => const NamedRoutesNavigationScreen(),
              ),
            ),
          ),
          NavigationCard(
            title: 'Homework_16',
            description: '',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute<Widget>(
                builder: (context) => const HomeWorkNavigationMainScreen(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
