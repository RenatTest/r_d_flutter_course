import 'package:r_d_flutter_course/features/homeworks/lesson_23_error_handling_homework/data/repository/entity/user_entity.dart';

class FakeUserRepository {
  bool _hasFailed = false;

  Future<UserEntity> getUserProfile() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    if (!_hasFailed) {
      _hasFailed = true;
      throw Exception('Server is temporarily unavailable');
    }
    return UserEntity(id: '1', name: 'Test User');
  }
}
