import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:r_d_flutter_course/features/app/screens/page_names.dart';
import 'package:r_d_flutter_course/features/widgets/presentation/screens/widgets_main_screen.dart';

class ArchitectureMainScreen extends StatelessWidget {
  const ArchitectureMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Architecture'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            NavigationCard(
              title: 'News Page',
              description:
                  'Example of architecture in a news page with '
                  'loading states, error states, and success states',
              onTap: () => context.goNamed(ScreenNames.news),
            ),
          ],
        ),
      ),
    );
  }
}
