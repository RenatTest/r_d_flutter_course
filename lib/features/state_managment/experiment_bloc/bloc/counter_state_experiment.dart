class CounterBlocStateExperiment {
  const CounterBlocStateExperiment({required this.counter});

  final int counter;

  CounterBlocStateExperiment copyWith({int? counter}) {
    return CounterBlocStateExperiment(counter: counter ?? this.counter);
  }
}
