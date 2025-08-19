import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_21/cubit/animation_cubit.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_21/cubit/animation_cubit_state.dart';

class AnimationCubitScreen extends StatelessWidget {
  const AnimationCubitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Cubit Screen'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: Center(
        child: BlocBuilder<AnimationCubit, AnimationCubitState>(
          builder: (context, state) {
            return TweenAnimationBuilder(
              tween: Tween<double>(
                begin: state.size == 100 ? 50 : 100,
                end: state.size == 50 ? 100 : 50,
              ),
              duration: const Duration(milliseconds: 500),
              onEnd: () {
                context.read<AnimationCubit>().toggleSize();
              },
              builder: (context, value, child) =>
                  Icon(Icons.favorite, color: Colors.red, size: value),
            );
          },
        ),
      ),
    );
  }
}
