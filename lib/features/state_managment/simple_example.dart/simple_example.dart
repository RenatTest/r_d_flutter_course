import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:r_d_flutter_course/features/app/screens/page_names.dart';
import 'package:r_d_flutter_course/features/state_managment/providers/counter_provider.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    // final provider = context
    //     .dependOnInheritedWidgetOfExactType<MyInheritedWidget>()!
    //     .provider;

    final provider = MyInheritedWidget.of(
      context,
    ); // спрощена форма запису, якщо є метод of в counter_provider
    return ColoredBox(
      color: const Color(0xFFF5F5F5),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Заголовок
            const Text(
              'Simple Counter',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF333333),
              ),
            ),

            const SizedBox(height: 40),

            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF000000).withValues(alpha: 0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: ListenableBuilder(
                listenable: provider,
                builder: (context, child) {
                  return Text(
                    '${provider.counter}',
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2196F3),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 40),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CounterButton(
                  text: '-',
                  color: const Color(0xFFFF5722),
                  onTap: provider.decrement,
                ),
                const SizedBox(width: 30),
                CounterButton(
                  text: '0',
                  color: const Color(0xFF9E9E9E),
                  onTap: provider.reset,
                  fontSize: 20,
                ),
                const SizedBox(width: 30),
                CounterButton(
                  text: '+',
                  color: const Color(0xFF4CAF50),
                  onTap: provider.increment,
                ),
              ],
            ),

            const SizedBox(height: 40),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              onPressed: () =>
                  context.pushNamed(ScreenNames.simpleStateManagement),
              child: const Text(
                'Next Counter Screen',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CounterButton extends StatelessWidget {
  const CounterButton({
    required this.text,
    required this.color,
    required this.onTap,
    this.fontSize = 32,
    super.key,
  });

  final String text;
  final Color color;
  final VoidCallback onTap;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xFFFFFFFF),
            ),
          ),
        ),
      ),
    );
  }
}
