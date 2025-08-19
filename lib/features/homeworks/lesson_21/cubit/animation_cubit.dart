import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_21/cubit/animation_cubit_state.dart';

class AnimationCubit extends Cubit<AnimationCubitState> {
  AnimationCubit() : super(const AnimationCubitState(size: 0.0));

  void toggleSize() {
    emit(
      state.size == 50 ? state.copyWith(size: 100) : state.copyWith(size: 50),
    );
  }
}
