import 'package:r_d_flutter_course/features/homeworks/lesson_20_rate_app_feature/bloc/rate_app_bloc_state.dart';

class RateAppBlocEvent {}

class RateAppBlocEventAddRating extends RateAppBlocEvent {
  RateAppBlocEventAddRating({required this.value});
  final int value;
}

class RateAppBlocEventResetRating extends RateAppBlocEvent {}

class RateAppBlocEventChangeStatus extends RateAppBlocEvent {
  RateAppBlocEventChangeStatus({required this.status});
  final RateAppBlocStatus status;
}

class RateAppBlocEventSendRating extends RateAppBlocEvent {}
