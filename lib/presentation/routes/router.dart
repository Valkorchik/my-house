import 'package:auto_route/auto_route.dart';
import 'package:my_house/presentation/pages/auth/auth_page.dart';
import 'package:my_house/presentation/pages/ad_list/adverts_list_page.dart';
import '../pages/splash/splash_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashPage, path: '/', initial: true),
    AutoRoute(page: AuthPage, path: 'auth'),
    AutoRoute(page: AdvertsListPage, path: 'adverts-list'),
  ],
)
class $AppRouter {}
