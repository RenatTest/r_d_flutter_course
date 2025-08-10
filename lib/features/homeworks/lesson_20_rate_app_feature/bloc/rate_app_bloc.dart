import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_20_rate_app_feature/bloc/rate_app_bloc_event.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_20_rate_app_feature/bloc/rate_app_bloc_state.dart';

class RateAppBloc extends Bloc<RateAppBlocEvent, RateAppBlocState> {
  RateAppBloc() : super(const RateAppBlocState(stars: 0)) {
    on<RateAppBlocEventAddRating>((event, emit) {
      emit(state.copyWith(stars: event.value));
    });

    on<RateAppBlocEventResetRating>((_, emit) {
      emit(state.copyWith(stars: 0));
    });
  }
}
