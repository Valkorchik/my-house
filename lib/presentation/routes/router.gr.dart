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
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;

import '../pages/ad_list/advert_item_details.dart' as _i4;
import '../pages/ad_list/adverts_list_page.dart' as _i3;
import '../pages/auth/auth_page.dart' as _i2;
import '../pages/faq/faq_page.dart' as _i5;
import '../pages/my_ad_list/my_advert_item_details.dart' as _i8;
import '../pages/my_ad_list/my_adverts_list_page.dart' as _i7;
import '../pages/splash/splash_page.dart' as _i1;
import '../pages/user/user_page.dart' as _i6;

class AppRouter extends _i9.RootStackRouter {
  AppRouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPage(),
      );
    },
    AuthRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.AuthPage(),
      );
    },
    AdvertsListRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.AdvertsListPage(),
      );
    },
    AdvertItemDetails.name: (routeData) {
      final args = routeData.argsAs<AdvertItemDetailsArgs>();
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.AdvertItemDetails(
          key: args.key,
          itemId: args.itemId,
        ),
      );
    },
    FaqRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.FaqPage(),
      );
    },
    UserRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.UserPage(),
      );
    },
    MyAdvertsListRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.MyAdvertsListPage(),
      );
    },
    MyAdvertItemDetails.name: (routeData) {
      final args = routeData.argsAs<MyAdvertItemDetailsArgs>();
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i8.MyAdvertItemDetails(
          key: args.key,
          itemId: args.itemId,
        ),
      );
    },
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i9.RouteConfig(
          AuthRoute.name,
          path: 'auth',
        ),
        _i9.RouteConfig(
          AdvertsListRoute.name,
          path: 'adverts-list',
        ),
        _i9.RouteConfig(
          AdvertItemDetails.name,
          path: 'item-details',
        ),
        _i9.RouteConfig(
          FaqRoute.name,
          path: 'faq',
        ),
        _i9.RouteConfig(
          UserRoute.name,
          path: 'user',
        ),
        _i9.RouteConfig(
          MyAdvertsListRoute.name,
          path: 'my-adverts-list',
        ),
        _i9.RouteConfig(
          MyAdvertItemDetails.name,
          path: 'my-item-details',
        ),
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i9.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.AuthPage]
class AuthRoute extends _i9.PageRouteInfo<void> {
  const AuthRoute()
      : super(
          AuthRoute.name,
          path: 'auth',
        );

  static const String name = 'AuthRoute';
}

/// generated route for
/// [_i3.AdvertsListPage]
class AdvertsListRoute extends _i9.PageRouteInfo<void> {
  const AdvertsListRoute()
      : super(
          AdvertsListRoute.name,
          path: 'adverts-list',
        );

  static const String name = 'AdvertsListRoute';
}

/// generated route for
/// [_i4.AdvertItemDetails]
class AdvertItemDetails extends _i9.PageRouteInfo<AdvertItemDetailsArgs> {
  AdvertItemDetails({
    _i10.Key? key,
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

  final _i10.Key? key;

  final String itemId;

  @override
  String toString() {
    return 'AdvertItemDetailsArgs{key: $key, itemId: $itemId}';
  }
}

/// generated route for
/// [_i5.FaqPage]
class FaqRoute extends _i9.PageRouteInfo<void> {
  const FaqRoute()
      : super(
          FaqRoute.name,
          path: 'faq',
        );

  static const String name = 'FaqRoute';
}

/// generated route for
/// [_i6.UserPage]
class UserRoute extends _i9.PageRouteInfo<void> {
  const UserRoute()
      : super(
          UserRoute.name,
          path: 'user',
        );

  static const String name = 'UserRoute';
}

/// generated route for
/// [_i7.MyAdvertsListPage]
class MyAdvertsListRoute extends _i9.PageRouteInfo<void> {
  const MyAdvertsListRoute()
      : super(
          MyAdvertsListRoute.name,
          path: 'my-adverts-list',
        );

  static const String name = 'MyAdvertsListRoute';
}

/// generated route for
/// [_i8.MyAdvertItemDetails]
class MyAdvertItemDetails extends _i9.PageRouteInfo<MyAdvertItemDetailsArgs> {
  MyAdvertItemDetails({
    _i10.Key? key,
    required String itemId,
  }) : super(
          MyAdvertItemDetails.name,
          path: 'my-item-details',
          args: MyAdvertItemDetailsArgs(
            key: key,
            itemId: itemId,
          ),
        );

  static const String name = 'MyAdvertItemDetails';
}

class MyAdvertItemDetailsArgs {
  const MyAdvertItemDetailsArgs({
    this.key,
    required this.itemId,
  });

  final _i10.Key? key;

  final String itemId;

  @override
  String toString() {
    return 'MyAdvertItemDetailsArgs{key: $key, itemId: $itemId}';
  }
}
