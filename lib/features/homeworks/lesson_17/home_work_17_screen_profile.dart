import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:r_d_flutter_course/features/state_managment/providers/auth_provider.dart';

class HomeWork17ScreenProfile extends StatelessWidget {
  const HomeWork17ScreenProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        Text('Profile Page'),
        Consumer<AuthProvider>(
          builder: (context, provider, child) {
            return Column(
              spacing: 10,
              children: [
                Text(
                  '${provider.userName}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2196F3),
                  ),
                ),
                Text(
                  '${provider.userEmail}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2196F3),
                  ),
                ),
              ],
            );
          },
        ),

        ElevatedButton(
          onPressed: () {
            context.read<AuthProvider>().logInWithGoogle();
          },
          child: Text('Sign in with Google'),
        ),
        ElevatedButton(
          onPressed: () {
            context.read<AuthProvider>().logOutWithGoogle();
          },
          child: Text('Log out with Google'),
        ),
      ],
    );
  }
}
