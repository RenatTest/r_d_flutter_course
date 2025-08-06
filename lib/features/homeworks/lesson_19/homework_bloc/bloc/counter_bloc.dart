import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_19/homework_bloc/bloc/counter_event.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_19/homework_bloc/bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterBlocEvent, CounterBlocState> {
  CounterBloc() : super(const CounterBlocState(counter: 0)) {
    on<CounterBlocIncrementEvent>((event, emit) {
      emit(state.copyWith(counter: state.counter + 1));
    });

    on<CounterBlocDecrementEvent>((event, emit) {
      emit(state.copyWith(counter: state.counter - 1));
    });
  }
}
