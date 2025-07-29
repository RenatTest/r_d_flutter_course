import 'package:go_router/go_router.dart';
import 'package:r_d_flutter_course/features/app/screens/home_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: '',
      builder: (context, state) => const HomeScreen(),
      routes: [
  
]
),
  ],
);
