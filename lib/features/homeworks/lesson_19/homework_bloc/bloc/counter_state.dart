class CounterBlocState {
  const CounterBlocState({required this.counter});

  final int counter;

  CounterBlocState copyWith({int? counter}) {
    return CounterBlocState(counter: counter ?? this.counter);
  }
}
