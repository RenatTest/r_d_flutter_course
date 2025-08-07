import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetConnectionCubit extends Cubit<ConnectivityResult> {
  InternetConnectionCubit({required Connectivity connectivity})
    : _connectivity = connectivity,
      super(ConnectivityResult.none) {
    _connectivityStream = _connectivity.onConnectivityChanged.listen((
      List<ConnectivityResult> resultList,
    ) {
      final firstResult = resultList.isNotEmpty
          ? resultList.first
          : ConnectivityResult.none;
      emit(firstResult);
    });
  }

  final Connectivity _connectivity;
  StreamSubscription<List<ConnectivityResult>>? _connectivityStream;

  @override
  Future<void> close() async {
    await _connectivityStream?.cancel();
    return super.close();
  }
}
