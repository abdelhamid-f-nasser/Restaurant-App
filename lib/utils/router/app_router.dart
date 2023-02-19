import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_app/ui/home/home_page.dart';
import 'package:restaurant_app/utils/router/index.dart';

/// Contains All available routes in the application
class AppRouter {
  static final router = GoRouter(
    debugLogDiagnostics: kDebugMode,
    initialLocation: MainRoutes.search.route.path,
    routes: [
      ..._mainRoutes,
    ],
    errorPageBuilder: (ctx, state) {
      log(state.error.toString());
      return CupertinoPage(
        key: state.pageKey,
        child: ColoredBox(
          color: CupertinoColors.systemPurple,
          child: Center(
            child: Text(state.error.toString()),
          ),
        ),
      );
    },
  );

  static final _mainRoutes = [
    GoRoute(
      name: MainRoutes.container.route.name,
      path: MainRoutes.container.route.path,
      pageBuilder: (context, state) => CupertinoPage(
        name: MainRoutes.container.route.name,
        key: state.pageKey,
        child: ColoredBox(
          color: CupertinoColors.systemRed,
          child: Center(
            child: ContainerPage(tabName: state.params['tab'] ?? BottomTabBarRoutes.favourite),
          ),
        ),
      ),
      routes: [..._homeRoutes],
    ),
  ];

  /// Routes nested in the home Page
  ///
  /// contains searchTab, FavouriteTab, Cart Page
  static final _homeRoutes = [
    GoRoute(
      name: MainRoutes.cart.route.name,
      path: MainRoutes.cart.route.path,
      pageBuilder: (context, state) => CupertinoPage(
        key: state.pageKey,
        child: ColoredBox(
          color: CupertinoColors.white,
          child: Center(
            child: Text(
              MainRoutes.cart.route.path,
            ),
          ),
        ),
        /*arguments: state.params*/
        /*args: state.extra as null,*/
      ),
      routes: [
        _cartRoutes,
      ],
    ),
  ];

  /// Routes of food Items
  ///
  /// shows the details route
  static final _foodItemRoute = GoRoute(
    name: MainRoutes.foodItemDetails.route.name,
    path: MainRoutes.foodItemDetails.route.path,
    pageBuilder: (context, state) => CupertinoPage(
      key: state.pageKey,
      child: ColoredBox(
        color: CupertinoColors.white,
        child: Center(
          child: Text(
            MainRoutes.foodItemDetails.route.path,
          ),
        ),
      ),
    ),
  );

  /// Routes inside the cart page
  ///
  /// contains the checkout route
  static final _cartRoutes = GoRoute(
    name: MainRoutes.checkout.route.name,
    path: MainRoutes.checkout.route.path,
    pageBuilder: (context, state) => CupertinoPage(
      key: state.pageKey,
      child: ColoredBox(
        color: CupertinoColors.white,
        child: Center(
          child: Text(
            MainRoutes.checkout.route.path,
          ),
        ),
      ),
    ),
  );
}
