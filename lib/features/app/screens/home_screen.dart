import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:r_d_flutter_course/features/app/screens/page_names.dart';
import 'package:r_d_flutter_course/features/state_managment/providers/counter_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final provider =
    //     Provider.of<CounterProvider>(context); // listen with ListenableBuilder

    // final provider = context.read<CounterProvider>(); // 2 варіант запису

    final provider = context
        .watch<CounterProvider>(); // 3 варіант запису без ListenableBuilder

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Lab'),
        backgroundColor: Colors.blue.shade100,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            // child: ListenableBuilder(
            //   listenable: provider,
            //   builder: (context, child) {
            //     return Text(
            //       '${provider.counter}',
            //       style: const TextStyle(
            //         fontSize: 20,
            //       ),
            //     );
            //   },
            // ),
            child: Text(
              // '${provider.counter}',
              '${provider.value}',
              style: const TextStyle(fontSize: 20),
            ),
            // Text(
            //   '${context.watch<CounterProvider>().counter}',
            //   style: const TextStyle(
            //     fontSize: 20,
            //   ),
            // ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FeatureCard(
              title: 'Widgets',
              onTap: () => context.goNamed(ScreenNames.widgets),
            ),
            FeatureCard(
              title: 'Navigation',
              onTap: () => context.goNamed(ScreenNames.navigation),
            ),
            FeatureCard(
              title: 'State Management',
              onTap: () => context.goNamed(ScreenNames.stateManagement),
            ),
          ],
        ),
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  const FeatureCard({required this.title, required this.onTap, super.key});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.grey.shade600,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
