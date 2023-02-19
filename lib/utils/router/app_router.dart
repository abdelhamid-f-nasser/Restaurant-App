import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_app/ui/home/container_page.dart';
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
            child: ContainerPage(
                tabName: state.params['tab'] ?? BottomTabBarRoutes.favourite),
          ),
        ),
      ),
    ),
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
        //Todo: Add arguments
        /*arguments: state.params*/
        /*args: state.extra as null,*/
      ),
    ),
    GoRoute(
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
    ),
    GoRoute(
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
    )
  ];
}
