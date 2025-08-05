import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_19/homework_bloc/bloc/counter_bloc.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_19/homework_bloc/bloc/counter_event.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_19/homework_bloc/bloc/counter_state.dart';

class HomeworkBlocScreen extends StatelessWidget {
  const HomeworkBlocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Homework Bloc Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),
            BlocBuilder<CounterBloc, CounterBlocState>(
              builder: (context, state) {
                return Text(
                  '${state.counter}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: null,
            onPressed: () =>
                context.read<CounterBloc>().add(CounterBlocDecrementEvent()),
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 16),
          FloatingActionButton(
            heroTag: null,
            onPressed: () =>
                context.read<CounterBloc>().add(CounterBlocIncrementEvent()),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
