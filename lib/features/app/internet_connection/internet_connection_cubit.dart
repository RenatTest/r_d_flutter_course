import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:rxdart/rxdart.dart';

class InternetState extends Equatable {
  const InternetState({
    required this.connectionType,
    required this.hasInternet,
  });

  final ConnectivityResult connectionType;
  final bool hasInternet;

  @override
  List<Object?> get props => [connectionType, hasInternet];
}

class InternetConnectionCubit extends Cubit<InternetState> {
  InternetConnectionCubit({
    required Connectivity connectivity,
    required InternetConnection internetConnection,
  }) : _connectivity = connectivity,
       _internetConnection = internetConnection,
       super(
         InternetState(
           connectionType: ConnectivityResult.none,
           hasInternet: false,
         ),
       ) {
    _subscription =
        Rx.combineLatest2<ConnectivityResult, InternetStatus, InternetState>(
          _connectivity.onConnectivityChanged
              .map(
                (list) =>
                    list.isNotEmpty ? list.first : ConnectivityResult.none,
              )
              .debounceTime(const Duration(milliseconds: 100)),
          _internetConnection.onStatusChange.debounceTime(
            const Duration(milliseconds: 100),
          ),
          (connectionType, status) => InternetState(
            connectionType: connectionType,
            hasInternet: status == InternetStatus.connected,
          ),
        ).distinct((prev, next) => prev == next).listen(emit);
  }

  final Connectivity _connectivity;
  final InternetConnection _internetConnection;

  StreamSubscription<InternetState>? _subscription;

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    return super.close();
  }
}
