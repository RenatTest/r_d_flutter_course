import 'package:flutter/material.dart';
import 'package:r_d_flutter_course/core/network/alerts_info_api/active_alerts_regions_api.dart';

class ActiveAlertsRegionsScreen extends StatefulWidget {
  const ActiveAlertsRegionsScreen({super.key});

  @override
  State<ActiveAlertsRegionsScreen> createState() =>
      _ActiveAlertsRegionsScreenState();
}

class _ActiveAlertsRegionsScreenState extends State<ActiveAlertsRegionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            ActiveAlertsRegionsApiImpl().getActiveAlertsRegions();
          },
          child: const Text('Active Alerts Regions'),
        ),
        backgroundColor: Colors.blue.shade100,
      ),
      body: Center(child: Text('Active Alerts Regions list')),
    );
  }
}
