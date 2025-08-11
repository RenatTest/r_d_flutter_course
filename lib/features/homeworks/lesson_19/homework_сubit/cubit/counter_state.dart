import 'package:equatable/equatable.dart';

class CounterCubitState extends Equatable {
  const CounterCubitState({
    required this.counter,
    required this.favoriteNumber,
  });

  final int counter;
  final int favoriteNumber;

  CounterCubitState copyWith({int? counter, int? favoriteNumber}) {
    return CounterCubitState(
      counter: counter ?? this.counter,
      favoriteNumber: favoriteNumber ?? this.favoriteNumber,
    );
  }

  @override
  List<Object?> get props => [counter, favoriteNumber];
}

void main() {
  final state1 = CounterCubitState(counter: 3, favoriteNumber: 22);
  final state2 = CounterCubitState(counter: 3, favoriteNumber: 22);

  print(state1.hashCode); // 360273621
  print(state2.hashCode); // 731477553

  print(state1 == state2); // false
}
