import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthProvider extends ChangeNotifier {
  String? _userName = 'not defined';
  String? _userEmail = 'not defined';

  String? get userName => _userName;
  String? get userEmail => _userEmail;

  Future<bool> logInWithGoogle() async {
    final user = await GoogleSignIn().signIn();
    if (user == null) return false;
    final userAuth = await user.authentication;
    final credential = GoogleAuthProvider.credential(
      idToken: userAuth.idToken,
      accessToken: userAuth.accessToken,
    );

    _userName = user.displayName;
    _userEmail = user.email;
    notifyListeners();

    await FirebaseAuth.instance.signInWithCredential(credential);
    return FirebaseAuth.instance.currentUser != null;
  }

  Future<void> logOutWithGoogle() async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
    _userName = 'not defined';
    _userEmail = 'not defined';
    notifyListeners();
  }
}
