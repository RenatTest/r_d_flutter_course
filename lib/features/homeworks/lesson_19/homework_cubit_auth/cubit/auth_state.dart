class AuthCubitState {
  const AuthCubitState({required this.name, required this.email});

  final String name;
  final String email;

  AuthCubitState copyWith({String? name, String? email}) {
    return AuthCubitState(name: name ?? this.name, email: email ?? this.email);
  }
}
