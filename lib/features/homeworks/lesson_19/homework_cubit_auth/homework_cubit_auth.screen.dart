import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_19/homework_cubit_auth/cubit/auth_cubit.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_19/homework_cubit_auth/cubit/auth_state.dart';

class HomeworkCubitAuthScreen extends StatelessWidget {
  const HomeworkCubitAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Homework Auth Cubit Screen')),
      body: Center(
        child: Column(
          spacing: 10,
          children: [
            BlocBuilder<AuthCubit, AuthCubitState>(
              builder: (context, state) {
                return Column(
                  spacing: 10,
                  children: [
                    Text(
                      state.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2196F3),
                      ),
                    ),
                    Text(
                      state.email,
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
              onPressed: context.read<AuthCubit>().logInWithGoogle,
              child: Text('Sign in with Google'),
            ),
            ElevatedButton(
              onPressed: context.read<AuthCubit>().logOutWithGoogle,
              child: Text('Log out with Google'),
            ),
          ],
        ),
      ),
    );
  }
}
