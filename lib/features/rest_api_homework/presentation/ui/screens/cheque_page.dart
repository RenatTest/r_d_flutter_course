import 'package:flutter/material.dart';

class ChequePage extends StatelessWidget {
  const ChequePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cheque Page'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: Center(child: Text('Cheque Data')),
    );
  }
}
