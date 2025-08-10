import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:r_d_flutter_course/features/app/screens/home_screen.dart';
import 'package:r_d_flutter_course/features/app/screens/page_names.dart';

class StateManagementMainScreen extends StatelessWidget {
  const StateManagementMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Management'),
        backgroundColor: Colors.green.shade100,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FeatureCard(
              title: 'Simple State Management',
              onTap: () => context.goNamed(ScreenNames.simpleStateManagement),
            ),
            FeatureCard(
              title: 'HomeworkCubit',
              onTap: () => context.goNamed(ScreenNames.homework19Cubit),
            ),
            FeatureCard(
              title: 'HomeworkBloc',
              onTap: () => context.goNamed(ScreenNames.homework19Bloc),
            ),
            FeatureCard(
              title: 'HomeworkAuthCubit',
              onTap: () => context.goNamed(ScreenNames.homework19AuthCubit),
            ),
            FeatureCard(
              title: 'ExperimentBlocScreen',
              onTap: () => context.goNamed(ScreenNames.experimentBloc),
            ),
            FeatureCard(
              title: 'Common Mistakes',
              onTap: () => context.goNamed(ScreenNames.commonMistakes),
            ),
            FeatureCard(
              title: 'Homework (LAB-20) Cubit',
              onTap: () async {
                final stars = await context.pushNamed<int>(
                  ScreenNames.homework20Cubit,
                );
                if (stars != null && context.mounted) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(_createSnackBar(context, stars));
                }
              },
            ),
            FeatureCard(
              title: 'Homework (LAB-20) Bloc',
              onTap: () async {
                final stars = await context.pushNamed<int>(
                  ScreenNames.homework20Bloc,
                );
                if (stars != null && context.mounted) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(_createSnackBar(context, stars));
                }
              },
            ),
            FeatureCard(
              title: 'Homework (LAB-20) Provider',
              onTap: () => context.goNamed(ScreenNames.homework20Provider),
            ),
          ],
        ),
      ),
    );
  }
}

SnackBar _createSnackBar(BuildContext context, int stars) {
  return SnackBar(
    content: Row(
      children: [
        Icon(Icons.star, color: Colors.amber.shade600),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Оцінка відправлена', style: const TextStyle(fontSize: 16)),
              Text(
                'Ви оцінили нашу програму на $stars',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ],
    ),
    behavior: SnackBarBehavior.floating,
    duration: const Duration(seconds: 3),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(6)),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    dismissDirection: DismissDirection.none,
  );
}
