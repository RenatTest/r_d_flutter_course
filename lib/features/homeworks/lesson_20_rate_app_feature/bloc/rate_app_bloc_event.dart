class RateAppBlocEvent {}

class RateAppBlocEventAddRating extends RateAppBlocEvent {
  RateAppBlocEventAddRating({required this.value});
  final int value;
}

class RateAppBlocEventResetRating extends RateAppBlocEvent {}
