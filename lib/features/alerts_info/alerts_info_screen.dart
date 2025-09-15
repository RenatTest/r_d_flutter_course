import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:r_d_flutter_course/features/app/screens/page_names.dart';
import 'package:r_d_flutter_course/features/widgets/presentation/screens/widgets_main_screen.dart';

class AlertsInfoScreen extends StatelessWidget {
  const AlertsInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alerts Info Screen'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            NavigationCard(
              title: 'Active alerts regions',
              description: 'View regions with active alerts',
              onTap: () => context.goNamed(ScreenNames.activeAlertsRegions),
            ),
            NavigationCard(
              title: 'Check my region',
              description: 'Checking the region for alerts',
              onTap: () => context.goNamed(ScreenNames.checkMyRegion),
            ),
          ],
        ),
      ),
    );
  }
}
