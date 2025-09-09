import 'package:flutter/material.dart';

class ActiveAlertsRegionsScreen extends StatelessWidget {
  const ActiveAlertsRegionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Active Alerts Regions'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: Center(child: Text('Active Alerts Regions Data')),
    );
  }
}
