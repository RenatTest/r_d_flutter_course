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
          ],
        ),
      ),
    );
  }
}
