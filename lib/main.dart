import 'package:flutter/material.dart';
import 'package:r_d_flutter_course/features/navigation/presentation/screens/base_navigation/simple_empty_screen.dart';
import 'package:r_d_flutter_course/features/navigation/presentation/screens/base_navigation/simple_screen_with_data.dart';
import 'package:r_d_flutter_course/features/navigation/presentation/screens/navigation_main_screen.dart';
import 'package:r_d_flutter_course/features/widgets/presentation/screens/widgets_main_screen.dart';

void main() {
  runApp(const FlutterWidgetsApp());
}

class FlutterWidgetsApp extends StatelessWidget {
  const FlutterWidgetsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/new_screen': (context) => const SimpleEmptyScreen(),
        '/simple_screen_with_data': (context) {
          return SimpleScreenWithData(id: '69');
        },
      },
      // onGenerateRoute: (settings) {
      //   if (settings.name == '/new_screen') {
      //     return MaterialPageRoute(
      //       builder: (context) => const SimpleEmptyScreen(),
      //     );
      //   }
      //   if (settings.name == '/simple_screen_with_data') {
      //     return MaterialPageRoute(
      //       builder: (context) => SimpleScreenWithData(
      //         id: settings.arguments! as String,
      //       ),
      //     );
      //   }
      //   return null;
      // },
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Lab'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FeatureCard(
              title: 'Widgets',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute<Widget>(
                  builder: (context) => const WidgetsScreen(),
                ),
              ),
            ),
            FeatureCard(
              title: 'Navigation',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute<Widget>(
                  builder: (context) => const NavigationMainScreen(),
                ),
              ),
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
