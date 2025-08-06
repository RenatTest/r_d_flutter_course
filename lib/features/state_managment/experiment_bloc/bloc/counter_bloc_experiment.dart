import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r_d_flutter_course/features/state_managment/experiment_bloc/bloc/counter_event_experiment.dart';
import 'package:r_d_flutter_course/features/state_managment/experiment_bloc/bloc/counter_state_experiment.dart';

class CounterBlocExperiment
    extends Bloc<CounterBlocEventExperiment, CounterBlocStateExperiment> {
  CounterBlocExperiment()
    : super(const CounterBlocStateExperiment(counter: 0)) {
    on<CounterBlocIncrementEventExperiment>((event, emit) {
      emit(state.copyWith(counter: state.counter + event.value));
    });

    on<CounterBlocDecrementEventExperiment>((event, emit) {
      emit(state.copyWith(counter: state.counter - event.value));
    });
  }
}
