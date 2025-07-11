import 'package:auto_route/auto_route.dart';
import 'package:r_d_flutter_course/main.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page, path: '/'),
    AutoRoute(page: SettingsRoute.page),
  ];
}
