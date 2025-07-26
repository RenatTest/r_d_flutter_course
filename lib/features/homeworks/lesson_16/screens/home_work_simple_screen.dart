import 'package:flutter/material.dart';
import 'package:r_d_flutter_course/features/navigation/presentation/widgets/navigation_button.dart';

class HomeWorkSimpleScreen extends StatelessWidget {
  const HomeWorkSimpleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.deepOrange,
        width: screenWidth / 2,
        child: Column(
          children: [
            SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: NavigationButton(
                title: 'Close drawer',
                onTap: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(title: const Text('Home work simple screen')),
      body: Center(
        child: Column(
          spacing: 10,
          children: [
            InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.green,
                ),
                child: const Center(
                  child: Text('Go back', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            Builder(
              builder: (context) {
                return IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
