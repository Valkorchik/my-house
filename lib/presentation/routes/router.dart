import 'package:auto_route/auto_route.dart';
import '../pages/auth_page.dart';
import '../pages/splash_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashPage, path: '/', initial: true),
    AutoRoute(page: AuthPage, path: 'auth'),
  ],
)
class $AppRouter {}
