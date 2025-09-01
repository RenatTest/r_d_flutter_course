import 'package:r_d_flutter_course/features/homeworks/lesson_23_error_handling_homework/data/repository/entity/user_entity.dart';

sealed class UserProfileState {}

final class UserProfileLoading implements UserProfileState {}

final class UserProfileLoaded implements UserProfileState {
  UserProfileLoaded(this.user);

  final UserEntity user;
}

final class UserProfileError implements UserProfileState {
  UserProfileError(this.error);

  final String error;
}
