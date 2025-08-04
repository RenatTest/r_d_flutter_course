import 'package:flutter/material.dart';

class CounterProvider extends ValueNotifier<int> {
  CounterProvider(super.value);

  // class CounterProvider extends ChangeNotifier {
  // int _counter = 0;

  // int get counter => _counter;

  void increment() {
    value++;
    // _counter++;
    // notifyListeners();
  }

  void decrement() {
    value--;
    // _counter--;
    // notifyListeners();
  }

  void reset() {
    value = 0;
    // _counter = 0;
    // notifyListeners();
  }
}
