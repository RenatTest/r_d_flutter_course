import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_20_rate_app_feature/bloc/rate_app_bloc_event.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_20_rate_app_feature/bloc/rate_app_bloc_state.dart';

class RateAppBloc extends Bloc<RateAppBlocEvent, RateAppBlocState> {
  RateAppBloc()
    : super(
        const RateAppBlocState(stars: 0, status: RateAppBlocStatus.initial),
      ) {
    on<RateAppBlocEventAddRating>((event, emit) {
      emit(
        state.copyWith(stars: event.value, status: RateAppBlocStatus.initial),
      );
    });

    on<RateAppBlocEventResetRating>((_, emit) {
      emit(state.copyWith(stars: 0, status: RateAppBlocStatus.initial));
    });

    on<RateAppBlocEventChangeStatus>((event, emit) {
      emit(state.copyWith(status: event.status));
    });

    on<RateAppBlocEventSendRating>((event, emit) async {
      emit(state.copyWith(status: RateAppBlocStatus.loading));
      // ignore: inference_failure_on_instance_creation
      await Future.delayed(const Duration(milliseconds: 500));
      emit(state.copyWith(status: RateAppBlocStatus.success));
    });
  }
}
