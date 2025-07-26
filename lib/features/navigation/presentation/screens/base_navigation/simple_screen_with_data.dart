import 'package:flutter/material.dart';
import 'package:r_d_flutter_course/features/navigation/presentation/screens/named_navigation/named_routes_navigation.dart';

class SimpleScreenWithData extends StatelessWidget {
  const SimpleScreenWithData({required this.id, super.key});

  final String id;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments! as NamedScreenArgs;

    return Scaffold(
      appBar: AppBar(title: const Text('Simple Screen With Data')),
      body: Center(
        child: Column(
          children: [
            Text('Product id from named parameter: $id'),
            Text('Product id from arguments: ${args.id}'),
            Text('Product id from arguments: ${args.name}'),
          ],
        ),
      ),
    );
  }
}
