import 'package:flutter/material.dart';

class CounterProvider extends ValueNotifier<int> {
  CounterProvider(super.value);

  void increment() {
    value++;
  }

  void decrement() {
    value--;
  }

  void reset() {
    value = 0;
  }
}
