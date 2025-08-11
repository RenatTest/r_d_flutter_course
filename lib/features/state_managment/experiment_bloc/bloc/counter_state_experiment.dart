class CounterBlocStateExperiment {
  const CounterBlocStateExperiment({
    required this.counter,
    this.favoriteNumber = 22,
  });

  final int counter;
  final int favoriteNumber;

  CounterBlocStateExperiment copyWith({int? counter, int? favoriteNumber}) {
    return CounterBlocStateExperiment(
      counter: counter ?? this.counter,
      favoriteNumber: favoriteNumber ?? this.favoriteNumber,
    );
  }
}
