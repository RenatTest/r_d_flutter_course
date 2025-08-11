import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class InternetConnectionCubit extends Cubit<ConnectivityResult> {
  InternetConnectionCubit({required Connectivity connectivity})
    : _connectivity = connectivity,
      super(ConnectivityResult.none) {
    _connectivitySubscription = _connectivity.onConnectivityChanged
        .debounceTime(const Duration(milliseconds: 100))
        .listen((List<ConnectivityResult> resultList) {
          final firstResult = resultList.isNotEmpty
              ? resultList.first
              : ConnectivityResult.none;
          emit(firstResult);
        });
  }

  final Connectivity _connectivity;
  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;

  @override
  Future<void> close() async {
    await _connectivitySubscription?.cancel();
    return super.close();
  }
}
