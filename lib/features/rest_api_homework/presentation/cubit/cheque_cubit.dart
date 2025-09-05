import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r_d_flutter_course/features/rest_api_homework/data/repository/cheque_repository.dart';
import 'package:r_d_flutter_course/features/rest_api_homework/presentation/cubit/cheque_state.dart';

class ChequeCubit extends Cubit<ChequeState> {
  ChequeCubit(this._repository) : super(const ChequeState.initial());

  final ChequeRepository _repository;

  Future<void> getCheque() async {
    emit(state.copyWith(status: ChequeStatus.loading));
    try {
      final cheque = await _repository.getCheque();

      emit(state.copyWith(status: ChequeStatus.loaded, cheque: cheque));
    } catch (e) {
      emit(
        state.copyWith(status: ChequeStatus.error, errorMessage: e.toString()),
      );

      rethrow;
    }
  }
}
