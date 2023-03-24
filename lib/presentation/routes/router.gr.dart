// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../pages/ad_list/advert_item_details.dart' as _i4;
import '../pages/ad_list/adverts_list_page.dart' as _i3;
import '../pages/auth/auth_page.dart' as _i2;
import '../pages/faq/faq_page.dart' as _i5;
import '../pages/splash/splash_page.dart' as _i1;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPage(),
      );
    },
    AuthRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.AuthPage(),
      );
    },
    AdvertsListRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.AdvertsListPage(),
      );
    },
    AdvertItemDetails.name: (routeData) {
      final args = routeData.argsAs<AdvertItemDetailsArgs>();
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.AdvertItemDetails(
          key: args.key,
          itemId: args.itemId,
        ),
      );
    },
    FaqRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.FaqPage(),
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i6.RouteConfig(
          AuthRoute.name,
          path: 'auth',
        ),
        _i6.RouteConfig(
          AdvertsListRoute.name,
          path: 'adverts-list',
        ),
        _i6.RouteConfig(
          AdvertItemDetails.name,
          path: 'item-details',
        ),
        _i6.RouteConfig(
          FaqRoute.name,
          path: 'faq',
        ),
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i6.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.AuthPage]
class AuthRoute extends _i6.PageRouteInfo<void> {
  const AuthRoute()
      : super(
          AuthRoute.name,
          path: 'auth',
        );

  static const String name = 'AuthRoute';
}

/// generated route for
/// [_i3.AdvertsListPage]
class AdvertsListRoute extends _i6.PageRouteInfo<void> {
  const AdvertsListRoute()
      : super(
          AdvertsListRoute.name,
          path: 'adverts-list',
        );

  static const String name = 'AdvertsListRoute';
}

/// generated route for
/// [_i4.AdvertItemDetails]
class AdvertItemDetails extends _i6.PageRouteInfo<AdvertItemDetailsArgs> {
  AdvertItemDetails({
    _i7.Key? key,
    required String itemId,
  }) : super(
          AdvertItemDetails.name,
          path: 'item-details',
          args: AdvertItemDetailsArgs(
            key: key,
            itemId: itemId,
          ),
        );

  static const String name = 'AdvertItemDetails';
}

class AdvertItemDetailsArgs {
  const AdvertItemDetailsArgs({
    this.key,
    required this.itemId,
  });

  final _i7.Key? key;

  final String itemId;

  @override
  String toString() {
    return 'AdvertItemDetailsArgs{key: $key, itemId: $itemId}';
  }
}

/// generated route for
/// [_i5.FaqPage]
class FaqRoute extends _i6.PageRouteInfo<void> {
  const FaqRoute()
      : super(
          FaqRoute.name,
          path: 'faq',
        );

  static const String name = 'FaqRoute';
}
