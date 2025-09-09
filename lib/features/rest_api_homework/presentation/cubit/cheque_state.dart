import 'package:r_d_flutter_course/features/rest_api_homework/data/repository/entities/cheque_entity.dart';

class ChequeState {
  const ChequeState({
    this.status = ChequeStatus.initial,
    this.cheque,
    this.errorMessage,
  });

  const ChequeState.initial()
    : status = ChequeStatus.loading,
      cheque = null,
      errorMessage = null;

  final ChequeStatus status;
  final ChequeEntity? cheque;
  final String? errorMessage;

  ChequeState copyWith({
    ChequeStatus? status,
    ChequeEntity? cheque,
    String? errorMessage,
  }) {
    return ChequeState(
      status: status ?? this.status,
      cheque: cheque ?? this.cheque,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

enum ChequeStatus { initial, loading, loaded, error }
