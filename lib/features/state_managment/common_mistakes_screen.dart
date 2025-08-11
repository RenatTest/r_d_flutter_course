// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommonMistakesScreen extends StatelessWidget {
  const CommonMistakesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SimpleCubitExample(),
      // 1.1
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Common Mistakes'),
              backgroundColor: Colors.orange.shade100,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '1. Намагаємось отримати доступ до блоку через контекст, '
                      'в якому ще не має створеного блоку',
                      style: TextStyle(fontSize: 16),
                    ),

                    // Ось тут не має доступу до state SimpleCubitExample
                    // Розкоментуйте, щоб побачити помилку
                    // Зверніть увагу на контекст, який використовується
                    // 1. Буде помилка, бо context це context з метода Widget build(BuildContext context)
                    // І SimpleCubitExample ще не створений.
                    // Рішення:
                    // 1.1 Обгорнути Scaffold у віджет Builder.
                    // 1.2 Винести віджет текст в окремий віджет.

                    // MyText(), // 1.2
                    Text(
                      'Current State number - ${context.read<SimpleCubitExample>().state}',
                    ),
                    const Divider(height: 48),

                    const Text(
                      '2. Переходимо на сторінку в якій намагаємось отримути доступ '
                      'до блоку, який не створений як глобальний',
                      style: TextStyle(fontSize: 16),
                    ),

                    // 2. Переходимо на нову сторінку і в ній
                    // немає доступу до state SimpleCubitExample
                    // Рішення:
                    // Зробити SimpleCubitExample глобальним або використати BlocProvider.value
                    // Але це не працює з go_router
                    ElevatedButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          // builder: (context) => const SimpleExamplePage(),
                          builder: (_) => BlocProvider.value(
                            value: context.read<SimpleCubitExample>(),
                            child: const SimpleExamplePage(),
                          ),
                        ),
                      ),
                      child: const Text('Перейти на тестову сторінку'),
                    ),
                    const Divider(height: 48),

                    const Text(
                      '3. Намагаємось відкрити dialog або bottom sheet, '
                      'в якому ще не має створеного блоку, бо це те саме як окремий екран',
                      style: TextStyle(fontSize: 16),
                    ),

                    // Рішення:
                    // Використати BlocProvider.value
                    ElevatedButton(
                      onPressed: () => showDialog<void>(
                        context: context,
                        builder: (_) => BlocProvider.value(
                          // _ - використовуємо context з Builder віджета
                          value: context.read<SimpleCubitExample>(),
                          child: AlertDialog(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            title: const Text('Example dialog'),
                            content: BlocBuilder<SimpleCubitExample, int>(
                              builder: (context, state) {
                                return Text('Current state number: $state');
                              },
                            ),
                          ),
                        ),
                      ),
                      child: const Text('Відкрити dialog'),
                    ),

                    const Divider(height: 48),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class SimpleExamplePage extends StatelessWidget {
  const SimpleExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exception example'),
        backgroundColor: Colors.orange.shade100,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Current State number '),
            // 2. Тут помилка, бо немає доступу до SimpleCubitExample
            Text('${context.read<SimpleCubitExample>().state}'),
          ],
        ),
      ),
    );
  }
}

class SimpleCubitExample extends Cubit<int> {
  SimpleCubitExample() : super(0);

  void increment() {
    emit(state + 1);
  }

  void decrement() {
    emit(state - 1);
  }
}

class MyText extends StatelessWidget {
  const MyText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Current State number - ${context.read<SimpleCubitExample>().state}',
    );
  }
}
