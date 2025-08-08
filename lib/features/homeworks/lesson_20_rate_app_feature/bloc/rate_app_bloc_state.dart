class RateAppBlocState {
  const RateAppBlocState({required this.stars});

  final int stars;

  RateAppBlocState copyWith({int? stars}) {
    return RateAppBlocState(stars: stars ?? this.stars);
  }
}
