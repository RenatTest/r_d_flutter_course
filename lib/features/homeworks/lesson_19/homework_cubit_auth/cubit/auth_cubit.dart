import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_19/homework_cubit_auth/cubit/auth_repository/auth_repository.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_19/homework_cubit_auth/cubit/auth_state.dart';

// Cubit with AuthRepo
class AuthCubit extends Cubit<AuthCubitState> {
  AuthCubit(this._authRepository) : super(const AuthCubitState());
  final AuthRepository _authRepository;

  Future<bool> logIn() async {
    final loginSuccess = await _authRepository.logIn();
    if (loginSuccess) {
      final user = AppUser(
        name: _authRepository.userName ?? 'not defined',
        email: _authRepository.userEmail ?? 'not defined',
      );
      emit(state.copyWith(user: user));
    }
    return loginSuccess;
  }

  Future<void> logOut() async {
    await _authRepository.logOut();
    emit(state.copyWith(user: AppUser.empty));
  }
}
