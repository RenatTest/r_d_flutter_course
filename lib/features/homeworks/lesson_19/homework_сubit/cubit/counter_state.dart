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

// https://dartpad.dev/?id=3e6552e8e47b51a21740fa8200fa89d0

// Щоб emit новий стан з використанням List -
// потрібно створити новий List на базі поточного
