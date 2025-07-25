import 'package:flutter/material.dart';
import 'package:r_d_flutter_course/features/navigation/presentation/screens/base_navigation/simple_empty_screen.dart';
import 'package:r_d_flutter_course/features/navigation/presentation/screens/base_navigation/simple_screen_with_data.dart';
import 'package:r_d_flutter_course/features/navigation/presentation/screens/base_navigation/simple_screen_with_returning_data.dart';
import 'package:r_d_flutter_course/features/navigation/presentation/widgets/navigation_button.dart';

class BaseNavigationSectionScreen extends StatelessWidget {
  const BaseNavigationSectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Base Navigation Section')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          NavagationButton(
            title: 'Simple transition to new screen',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<Widget>(
                  builder: (context) => const SimpleEmptyScreen(),
                ),
              );
            },
          ),
          //https://docs.flutter.dev/cookbook/animation/page-route-animation
          NavagationButton(
            title: 'Simple transition with custom transition',
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder<Widget>(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const SimpleEmptyScreen(),
                  // transitionsBuilder:
                  //     (context, animation, secondaryAnimation, child) =>
                  //         RotationTransition(
                  //   turns: animation,
                  //   child: child,
                  // ),
                ),
              );
            },
          ),
          NavagationButton(
            title: 'Transition with arguments',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<Widget>(
                  builder: (context) => const SimpleScreenWithData(id: '123'),
                ),
              );
            },
          ),
          NavagationButton(
            title: 'Transition with returning data',
            onTap: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute<String>(
                  builder: (context) =>
                      const SimpleScreenWithReturningData(guestName: 'Pavlo'),
                ),
              );

              if (result != null && context.mounted) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(_createSnackBar(context, result));
              }
            },
          ),
          NavagationButton(
            title: 'Navigation to modal bottom sheet',
            onTap: () {
              showModalBottomSheet<void>(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) => Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Modal bottom sheet example',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text('Modal bottom sheet example data'),
                        SizedBox(height: 100),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

SnackBar _createSnackBar(BuildContext context, String result) {
  return SnackBar(
    content: Row(
      children: [
        const Icon(Icons.card_giftcard, color: Colors.white),
        const SizedBox(width: 12),
        Expanded(child: Text(result, style: const TextStyle(fontSize: 16))),
      ],
    ),
    behavior: SnackBarBehavior.floating,
    duration: const Duration(seconds: 4),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(6)),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    dismissDirection: DismissDirection.none,
  );
}
