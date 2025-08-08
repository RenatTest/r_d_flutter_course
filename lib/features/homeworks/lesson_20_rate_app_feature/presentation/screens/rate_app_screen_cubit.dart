// ignore_for_file: lines_longer_than_80_chars
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_20_rate_app_feature/cubit/rate_app_cubit.dart';
import 'package:r_d_flutter_course/features/homeworks/lesson_20_rate_app_feature/cubit/rate_app_cubit_state.dart';

class RateAppScreenCubit extends StatelessWidget {
  const RateAppScreenCubit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter lab cubit'),
        backgroundColor: Colors.amber.shade100,
        leading: BlocBuilder<RateAppCubit, RateAppCubitState>(
          builder: (context, state) {
            return BackButton(
              onPressed: () {
                if (state.stars == 0) {
                  context.pop();
                } else {
                  context.read<RateAppCubit>().resetRating();
                  Future.delayed(const Duration(milliseconds: 500), () {
                    if (context.mounted) {
                      context.pop();
                    }
                  });
                }
              },
            );
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.amber.shade50, Colors.white],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 32),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Text(
                      'Оцінити  застосунок',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                    const SizedBox(height: 24),
                    BlocBuilder<RateAppCubit, RateAppCubitState>(
                      builder: (context, state) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(5, (index) {
                            final isSelected = index < state.stars;
                            return Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 4,
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    context.read<RateAppCubit>().rateApp(
                                      index + 1,
                                    );
                                  },
                                  iconSize: 48,
                                  icon: AnimatedScale(
                                    duration: const Duration(milliseconds: 200),
                                    scale: isSelected ? 1.0 : 0.9,
                                    curve: Curves.easeOut,
                                    child: AnimatedSwitcher(
                                      duration: const Duration(
                                        milliseconds: 200,
                                      ),
                                      transitionBuilder: (child, animation) =>
                                          ScaleTransition(
                                            scale: animation,
                                            child: child,
                                          ),
                                      child: Icon(
                                        isSelected
                                            ? Icons.star
                                            : Icons.star_border,
                                        color: Colors.amber.shade600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Container(
                width: double.infinity,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    colors: [Colors.amber.shade400, Colors.amber.shade600],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.amber.shade200,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: () => _showDialog(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Відправити оцінку',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextButton.icon(
                onPressed: context.read<RateAppCubit>().resetRating,
                icon: const Icon(Icons.refresh, size: 20),
                label: const Text(
                  'Скинути оцінку',
                  style: TextStyle(fontSize: 16),
                ),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 32),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: Colors.grey.shade600,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    BlocBuilder<RateAppCubit, RateAppCubitState>(
                      builder: (context, state) {
                        return Text(
                          state.stars == 0
                              ? 'Тут буде Ваша оцінка'
                              : 'Ви оцінили нашу програму на ${state.stars}',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.w500,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _showDialog(BuildContext context) {
  showDialog<void>(
    context: context,
    builder: (context) {
      return Dialog(
        child: SizedBox(
          width: 200,
          height: 200,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: BlocBuilder<RateAppCubit, RateAppCubitState>(
              builder: (context, state) {
                return Column(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      state.stars == 0
                          ? 'Оцінка не відправлена'
                          : 'Оцінка відправлена',
                      style: TextStyle(
                        fontSize: 20,
                        color: state.stars == 0 ? Colors.red : Colors.green,
                      ),
                    ),
                    Text(
                      state.stars == 0
                          ? 'Оцініть будь-ласка програму перед відправкою'
                          : 'Ви оцінили нашу програму на ${state.stars}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: state.stars == 0 ? Colors.red : Colors.green,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      );
    },
  );
}
