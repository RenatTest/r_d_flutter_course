import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:r_d_flutter_course/features/app/screens/page_names.dart';
import 'package:r_d_flutter_course/features/state_managment/experiment_bloc/bloc/counter_bloc_experiment.dart';
import 'package:r_d_flutter_course/features/state_managment/experiment_bloc/bloc/counter_event_experiment.dart';
import 'package:r_d_flutter_course/features/state_managment/experiment_bloc/bloc/counter_state_experiment.dart';

class ExperimentBlocScreen extends StatelessWidget {
  const ExperimentBlocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Experiment Bloc Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('New Value'),
            BlocListener<CounterBlocExperiment, CounterBlocStateExperiment>(
              listenWhen: (previous, current) {
                return current.counter > 300;
              },
              listener: (context, state) {
                context.goNamed(ScreenNames.home);
              },
              child:
                  BlocBuilder<
                    CounterBlocExperiment,
                    CounterBlocStateExperiment
                  >(
                    builder: (context, state) {
                      return Text(
                        '${state.counter}',
                        style: Theme.of(context).textTheme.headlineMedium,
                      );
                    },
                  ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: null,
            onPressed: () => context.read<CounterBlocExperiment>().add(
              CounterBlocDecrementEventExperiment(value: 33),
            ),
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 16),
          FloatingActionButton(
            heroTag: null,
            onPressed: () => context.read<CounterBlocExperiment>().add(
              CounterBlocIncrementEventExperiment(value: 88),
            ),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
