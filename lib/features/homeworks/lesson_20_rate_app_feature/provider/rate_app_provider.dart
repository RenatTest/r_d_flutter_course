import 'package:flutter/material.dart';

class RateAppProvider extends ValueNotifier<int> {
  RateAppProvider(super.value);

  void rateApp(int selectedStars) {
    value = selectedStars;
  }

  void resetRating() {
    value = 0;
  }
}
