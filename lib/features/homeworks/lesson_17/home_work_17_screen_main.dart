import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeWork17ScreenMain extends StatelessWidget {
  const HomeWork17ScreenMain({required this.child, super.key});
  final Widget child;

  int _getIndex(String location) {
    if (location.contains('/profile')) return 1;
    if (location.contains('/settings')) return 2;
    return 0;
  }

  void _onTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/navigation/home');
      case 1:
        context.go('/navigation/profile');
      case 2:
        context.go('/navigation/settings');
    }
  }

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    final index = _getIndex(location);

    return Scaffold(
      appBar: AppBar(title: Text('Page with Nav bar items')),
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (i) => _onTap(context, i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
