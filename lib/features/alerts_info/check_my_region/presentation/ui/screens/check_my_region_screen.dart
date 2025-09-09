import 'package:flutter/material.dart';

class CheckMyRegionScreen extends StatelessWidget {
  const CheckMyRegionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Check My Region'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: Center(child: Text('Check My Region is with alerts')),
    );
  }
}
