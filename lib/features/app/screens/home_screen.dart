import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:r_d_flutter_course/features/app/screens/page_names.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_19/homework_%D1%81ubit/cubit/counter_cubit.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_19/homework_%D1%81ubit/cubit/counter_state.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_19/homework_bloc/bloc/counter_bloc.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_19/homework_bloc/bloc/counter_state.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_19/homework_cubit_auth/cubit/auth_cubit.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_19/homework_cubit_auth/cubit/auth_state.dart';
import 'package:r_d_flutter_course/features/state_managment/experiment_bloc/bloc/counter_bloc_experiment.dart';
import 'package:r_d_flutter_course/features/state_managment/experiment_bloc/bloc/counter_state_experiment.dart';
import 'package:r_d_flutter_course/features/state_managment/providers/counter_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Lab'),
        backgroundColor: Colors.blue.shade100,
        actions: [
          IconButton(
            onPressed: () => _showDialog(context),
            icon: const Icon(Icons.numbers),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FeatureCard(
              title: 'Widgets',
              onTap: () => context.goNamed(ScreenNames.widgets),
            ),
            FeatureCard(
              title: 'Navigation',
              onTap: () => context.goNamed(ScreenNames.navigation),
            ),
            FeatureCard(
              title: 'State Management',
              onTap: () => context.goNamed(ScreenNames.stateManagement),
            ),
            FeatureCard(
              title: 'Animations',
              onTap: () => context.goNamed(ScreenNames.animations),
            ),
            FeatureCard(
              title: 'Error Handling',
              onTap: () => context.goNamed(ScreenNames.errorHandling),
            ),
            FeatureCard(
              title: 'Architecture',
              onTap: () => context.goNamed(ScreenNames.architecture),
            ),
            FeatureCard(
              title: 'Rest API',
              onTap: () => context.goNamed(ScreenNames.restApi),
            ),
            FeatureCard(
              title: 'Rest API homework',
              onTap: () => context.goNamed(ScreenNames.restApiHomework),
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return Dialog(
          child: SizedBox(
            width: 220,
            height: 270,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Counter Provider:',
                      style: TextStyle(
                        fontSize: 22,
                        color: HexColor('#015399'),
                      ),
                    ),
                    Consumer<CounterProvider>(
                      builder: (context, counterProvider, child) {
                        return Text(
                          ' ${counterProvider.value}',
                          style: TextStyle(
                            fontSize: 22,
                            color: HexColor('#015399'),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Counter Cubit:',
                      style: TextStyle(
                        fontSize: 22,
                        color: HexColor('#45d2fd'),
                      ),
                    ),
                    BlocBuilder<CounterCubit, CounterCubitState>(
                      builder: (context, state) {
                        return Text(
                          ' ${state.counter}',
                          style: TextStyle(
                            fontSize: 22,
                            color: HexColor('#45d2fd'),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Counter Bloc:',
                      style: TextStyle(
                        fontSize: 22,
                        color: HexColor('#3c85c7'),
                      ),
                    ),

                    BlocBuilder<CounterBloc, CounterBlocState>(
                      builder: (context, state) {
                        return Text(
                          ' ${state.counter}',
                          style: TextStyle(
                            fontSize: 22,
                            color: HexColor('#3c85c7'),
                          ),
                        );
                      },
                    ),
                  ],
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Auth Cubit:',
                      style: TextStyle(
                        fontSize: 22,
                        color: HexColor('#e85f29'),
                      ),
                    ),
                    BlocBuilder<AuthCubit, AuthCubitState>(
                      builder: (context, state) {
                        return Column(
                          children: [
                            Text(
                              state.user.name,
                              style: TextStyle(
                                fontSize: 18,
                                color: HexColor('#e85f29'),
                              ),
                            ),
                            Text(
                              state.user.email,
                              style: TextStyle(
                                fontSize: 18,
                                color: HexColor('#e85f29'),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Counter Bloc Ex:',
                      style: TextStyle(
                        fontSize: 22,
                        color: HexColor('#FF0000'),
                      ),
                    ),

                    BlocBuilder<
                      CounterBlocExperiment,
                      CounterBlocStateExperiment
                    >(
                      builder: (context, state) {
                        return Text(
                          ' ${state.counter}',
                          style: TextStyle(
                            fontSize: 22,
                            color: HexColor('#FF0000'),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class FeatureCard extends StatelessWidget {
  const FeatureCard({required this.title, required this.onTap, super.key});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.grey.shade600,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
