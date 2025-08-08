class CounterBlocEventExperiment {}

class CounterBlocIncrementEventExperiment extends CounterBlocEventExperiment {
  CounterBlocIncrementEventExperiment({required this.value});
  final int value;
}

class CounterBlocDecrementEventExperiment extends CounterBlocEventExperiment {
  CounterBlocDecrementEventExperiment({required this.value});
  final int value;
}
