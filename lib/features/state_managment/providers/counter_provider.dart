import 'package:flutter/widgets.dart';

class CounterProvider extends ChangeNotifier {
  CounterProvider(this._counter);
  int _counter;

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    _counter--;
    notifyListeners();
  }

  void reset() {
    _counter = 0;
    notifyListeners();
  }
}

class MyInheritedWidget extends InheritedWidget {
  const MyInheritedWidget({
    required this.provider,
    required super.child,
    super.key,
  });

  final CounterProvider provider;

  static CounterProvider of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<MyInheritedWidget>()!
        .provider;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
