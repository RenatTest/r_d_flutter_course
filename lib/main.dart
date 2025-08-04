import 'package:flutter/material.dart';
import 'package:r_d_flutter_course/features/state_managment/providers/counter_provider.dart';
import 'package:r_d_flutter_course/router/app_router.dart';

void main() {
  runApp(const FlutterWidgetsApp());
}

class FlutterWidgetsApp extends StatelessWidget {
  const FlutterWidgetsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MyInheritedWidget(
      provider: CounterProvider(22),
      child: MaterialApp.router(routerConfig: router),
    );
  }
}
