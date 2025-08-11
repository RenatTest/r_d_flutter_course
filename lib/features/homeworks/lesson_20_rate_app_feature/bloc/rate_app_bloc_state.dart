class RateAppBlocState {
  const RateAppBlocState({
    required this.stars,
    this.status = RateAppBlocStatus.initial,
  });

  final int stars;
  final RateAppBlocStatus status;

  RateAppBlocState copyWith({required RateAppBlocStatus status, int? stars}) {
    return RateAppBlocState(stars: stars ?? this.stars, status: status);
  }
}

enum RateAppBlocStatus { initial, loading, success }
