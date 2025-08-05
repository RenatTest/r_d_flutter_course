import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_19/homework_cubit_auth/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthCubitState> {
  AuthCubit()
    : super(const AuthCubitState(name: 'not defined', email: 'not defined'));

  Future<bool> logInWithGoogle() async {
    final user = await GoogleSignIn().signIn();
    if (user == null) return false;

    final userAuth = await user.authentication;
    final credential = GoogleAuthProvider.credential(
      idToken: userAuth.idToken,
      accessToken: userAuth.accessToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);
    emit(state.copyWith(name: user.displayName, email: user.email));
    return FirebaseAuth.instance.currentUser != null;
  }

  Future<void> logOutWithGoogle() async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
    emit(state.copyWith(name: 'not defined', email: 'not defined'));
  }
}
