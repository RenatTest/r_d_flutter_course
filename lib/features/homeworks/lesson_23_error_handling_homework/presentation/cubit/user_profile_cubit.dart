import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_23_error_handling_homework/data/repository/fake_user_repository.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_23_error_handling_homework/presentation/cubit/user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileCubit(this.repository) : super(UserProfileLoading());

  final FakeUserRepository repository;

  Future<void> loadUserProfile() async {
    emit(UserProfileLoading());

    final user = await repository.getUserProfile();

    emit(UserProfileLoaded(user));
  }
}
