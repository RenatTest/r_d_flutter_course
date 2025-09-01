import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:r_d_flutter_course/features/app/screens/page_names.dart';
import 'package:r_d_flutter_course/features/widgets/presentation/screens/widgets_main_screen.dart';

class ErrorHandlingMainScreen extends StatelessWidget {
  const ErrorHandlingMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error Handling'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            NavigationCard(
              title: 'Products Page Example',
              description:
                  'Example of error handling in a products page with '
                  'loading states, error states, and success states',
              onTap: () => context.goNamed(ScreenNames.productsPageExample),
            ),
            NavigationCard(
              title: 'Homework 23: \nError Handling',
              description: 'User profile page with error handling',
              onTap: () => context.goNamed(ScreenNames.homework23ErrorHandling),
            ),
          ],
        ),
      ),
    );
  }
}
