// ignore_for_file: avoid_print

import 'dart:ui';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:provider/provider.dart';
import 'package:r_d_flutter_course/core/network/products_api/products_api.dart';
import 'package:r_d_flutter_course/features/app/internet_connection/internet_connection_cubit.dart';
import 'package:r_d_flutter_course/features/error_handling/data/data_source/products_data_source.dart';
import 'package:r_d_flutter_course/features/error_handling/data/repository/products_repository.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_19/homework_%D1%81ubit/cubit/counter_cubit.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_19/homework_bloc/bloc/counter_bloc.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_19/homework_cubit_auth/cubit/auth_cubit.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_19/homework_cubit_auth/cubit/auth_repository/auth_repository.dart';
import 'package:r_d_flutter_course/features/state_managment/experiment_bloc/bloc/counter_bloc_experiment.dart';
import 'package:r_d_flutter_course/features/state_managment/providers/auth_provider.dart';
import 'package:r_d_flutter_course/features/state_managment/providers/counter_provider.dart';
import 'package:r_d_flutter_course/firebase_options.dart';
import 'package:r_d_flutter_course/router/app_router.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

void main() async {
  // FlutterError.onError = (errorDetails) {
  //   print('FlutterError errorDetails: $errorDetails');
  // };

  PlatformDispatcher.instance.onError = (error, stackTrace) {
    print('PlatformDispatcher error: $error');
    print('PlatformDispatcher stackTrace: $stackTrace');
    return true;
  };

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await SentryFlutter.init((options) {
    options
      ..dsn =
          'https://a0f9b76ad5dd37811287e2399efcd71f@o4509921650409472.ingest.us.sentry.io/4509921651261440'
      ..sendDefaultPii = true;
  }, appRunner: () => runApp(SentryWidget(child: const FlutterWidgetsApp())));
  // runApp(const FlutterWidgetsApp());
}

class FlutterWidgetsApp extends StatelessWidget {
  const FlutterWidgetsApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 2 variant
    return RepositoryProvider(
      create: (context) =>
          ProductsRepositoryImpl(ProductsDataSourceImpl(ProductsApiImpl())),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => CounterCubit()),
          BlocProvider(create: (context) => CounterBloc()),
          BlocProvider(
            create: (context) => AuthCubit(FirebaseAuthRepository()),
          ),
          BlocProvider(create: (context) => CounterBlocExperiment()),
          BlocProvider(
            create: (context) => InternetConnectionCubit(
              connectivity: Connectivity(),
              internetConnection: InternetConnection(),
            ),
          ),
        ],
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => CounterProvider(0)),
            ChangeNotifierProvider(create: (context) => AuthProvider()),
          ],
          child: MaterialApp.router(routerConfig: router),
        ),
      ),
    );
  }
}
