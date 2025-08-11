import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:r_d_flutter_course/features/app/screens/page_names.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_19/homework_cubit_auth/cubit/auth_cubit.dart';
import 'package:r_d_flutter_course/features/navigation/presentation/widgets/navigation_button.dart';
import 'package:r_d_flutter_course/features/state_managment/common_mistakes_screen.dart';
import 'package:r_d_flutter_course/features/state_managment/experiment_bloc/bloc/counter_bloc_experiment.dart';
import 'package:r_d_flutter_course/features/state_managment/experiment_bloc/bloc/counter_event_experiment.dart';
import 'package:r_d_flutter_course/features/state_managment/experiment_bloc/bloc/counter_state_experiment.dart';

class ExperimentBlocScreen extends StatelessWidget {
  const ExperimentBlocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CounterBlocExperiment, CounterBlocStateExperiment>(
      listener: (context, state) {
        if (state.counter > 500) {
          context.goNamed(ScreenNames.home);
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Experiment Bloc Screen')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('New Value'),
              // BlocConsumer<CounterBlocExperiment, CounterBlocStateExperiment>(
              //   builder: (context, state) {
              //     return Text(
              //       '${state.counter}',
              //       style: Theme.of(context).textTheme.headlineMedium,
              //     );
              //   },
              //   listenWhen: (previous, current) {
              //     return current.counter > 300;
              //   },
              //   listener: (context, state) {
              //     context.goNamed(ScreenNames.home);
              //   },
              // ),
              // BlocListener<CounterBlocExperiment, CounterBlocStateExperiment>(
              //   listenWhen: (previous, current) {
              //     return current.counter > 300;
              //   },
              //   listener: (context, state) {
              //     context.goNamed(ScreenNames.home);
              //   },
              //   child:
              //       BlocBuilder<
              //         CounterBlocExperiment,
              //         CounterBlocStateExperiment
              //       >(
              //         builder: (context, state) {
              //           return Text(
              //             '${state.counter}',
              //             style: Theme.of(context).textTheme.headlineMedium,
              //           );
              //         },
              //       ),
              // ),
              // BlocBuilder<CounterBlocExperiment, CounterBlocStateExperiment>(
              //   buildWhen: (previous, current) {
              //     return current.counter > 300;
              //   },
              //   bloc: CounterBlocExperiment(), // another bloc created
              //   builder: (context, state) {
              //     return Text(
              //       '${state.counter}',
              //       style: Theme.of(context).textTheme.headlineMedium,
              //     );
              //   },
              // ),
              BlocSelector<
                CounterBlocExperiment,
                CounterBlocStateExperiment,
                int
              >(
                selector: (state) => state.counter,
                builder: (context, counter) {
                  return Text(
                    '$counter',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: NavigationButton(
                  title: 'send Bloc value to the new screen',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<Widget>(
                        builder: (context) => BlocProvider.value(
                          value: context.read<AuthCubit>(),
                          child: CommonMistakesScreen(),
                        ),
                      ),
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
      ),
    );
  }
}
