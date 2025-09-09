// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r_d_flutter_course/features/rest_api_homework/presentation/cubit/cheque_cubit.dart';
import 'package:r_d_flutter_course/features/rest_api_homework/presentation/cubit/cheque_state.dart';

class ChequePage extends StatelessWidget {
  const ChequePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cheque Page'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: Center(
        child: BlocBuilder<ChequeCubit, ChequeState>(
          builder: (context, state) {
            return switch (state.status) {
              // Initial state
              ChequeStatus.initial => const Center(
                child: Text('Cheque Page', style: TextStyle(fontSize: 24)),
              ),

              // Loading state
              ChequeStatus.loading => const Center(
                child: CircularProgressIndicator(),
              ),

              // Loaded state
              ChequeStatus.loaded => Center(
                child: Column(
                  spacing: 10,
                  children: [
                    Text(
                      'Чек: ${state.cheque?.chequeId.toString() ?? '000'}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Вартість: ${state.cheque?.totalAmount.toString() ?? '0'} грн',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.cheque?.items.length,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: const EdgeInsets.all(10),
                            child: ListTile(
                              title: Text(
                                state.cheque?.items[index] ?? 'товар',
                              ),
                              trailing: const Icon(Icons.shopping_basket),
                            ),
                          );
                        },
                      ),
                    ),
                    Text(
                      'Передбачення:\n${state.cheque?.prediction ?? 'Без передбачення :('}',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),

              // Error state
              ChequeStatus.error => Center(
                child: Text(
                  state.errorMessage ?? 'Error',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 24),
                ),
              ),
            };
          },
        ),
      ),
    );
  }
}
