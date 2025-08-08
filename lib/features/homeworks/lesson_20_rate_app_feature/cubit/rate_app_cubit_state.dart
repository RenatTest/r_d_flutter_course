class RateAppCubitState {
  const RateAppCubitState({required this.stars});

  final int stars;

  RateAppCubitState copyWith({int? stars}) {
    return RateAppCubitState(stars: stars ?? this.stars);
  }
}
