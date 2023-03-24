import 'package:auto_route/auto_route.dart';
import 'package:my_house/presentation/pages/ad_list/advert_item_details.dart';
import 'package:my_house/presentation/pages/auth/auth_page.dart';
import 'package:my_house/presentation/pages/ad_list/adverts_list_page.dart';
import 'package:my_house/presentation/pages/faq/faq_page.dart';
import '../pages/splash/splash_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashPage, path: '/', initial: true),
    AutoRoute(page: AuthPage, path: 'auth'),
    AutoRoute(page: AdvertsListPage, path: 'adverts-list'),
    AutoRoute(page: AdvertItemDetails, path: 'item-details'),
    AutoRoute(page: FaqPage, path: 'faq'),
  ],
)
class $AppRouter {}
