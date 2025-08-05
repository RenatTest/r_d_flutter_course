import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_19/homework_%D1%81ubit/cubit/counter_cubit.dart';
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
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => CounterProvider(22)),
          ChangeNotifierProvider(create: (context) => AuthProvider()),
        ],
        child: MaterialApp.router(routerConfig: router),
      ),
    );
  }
}
