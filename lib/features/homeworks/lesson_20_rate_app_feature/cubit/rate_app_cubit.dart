import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_20_rate_app_feature/cubit/rate_app_cubit_state.dart';

class RateAppCubit extends Cubit<RateAppCubitState> {
  RateAppCubit() : super(const RateAppCubitState(stars: 0));

  void rateApp(int selectedStars) {
    emit(state.copyWith(stars: selectedStars));
  }

  void resetRating() {
    emit(state.copyWith(stars: 0));
  }
}
