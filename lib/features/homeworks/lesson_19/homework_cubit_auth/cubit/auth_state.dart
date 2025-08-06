class AuthCubitState {
  const AuthCubitState({this.user = AppUser.empty});
  final AppUser user;

  AuthCubitState copyWith({AppUser? user}) {
    return AuthCubitState(user: user ?? this.user);
  }
}

class AppUser {
  const AppUser({required this.name, required this.email});
  final String name;
  final String email;

  static const empty = AppUser(name: 'not defined', email: 'not defined');
}
