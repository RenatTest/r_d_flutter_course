import 'package:flutter/material.dart';
import 'package:r_d_flutter_course/core/network/cheque_api/cheque_api.dart';

class ChequePage extends StatefulWidget {
  const ChequePage({super.key});

  @override
  State<ChequePage> createState() => _ChequePageState();
}

class _ChequePageState extends State<ChequePage> {
  @override
  void initState() {
    ChequeApiImpl().getCheque();
    super.initState();
  }

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
