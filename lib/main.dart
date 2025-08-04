import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:r_d_flutter_course/features/state_managment/providers/auth_provider.dart';
import 'package:r_d_flutter_course/features/state_managment/providers/counter_provider.dart';
import 'package:r_d_flutter_course/firebase_options.dart';
import 'package:r_d_flutter_course/router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const FlutterWidgetsApp());
}

class FlutterWidgetsApp extends StatelessWidget {
  const FlutterWidgetsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterProvider(22)),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
      ],
      child: MaterialApp.router(routerConfig: router),
    );
  }
}
