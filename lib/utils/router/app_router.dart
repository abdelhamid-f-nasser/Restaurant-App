import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_app/domain/entity/index.dart';
import 'package:restaurant_app/ui/cart/cart_page.dart';
import 'package:restaurant_app/ui/checkout/checkout_page.dart';
import 'package:restaurant_app/ui/container/index.dart';
import 'package:restaurant_app/ui/item_detail/index.dart';
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
        child: ContainerPage(
          tabName: state.params['tab'] ?? BottomTabBarRoutes.favourite,
        ),
      ),
    ),
    GoRoute(
      name: MainRoutes.cart.route.name,
      path: MainRoutes.cart.route.path,
      pageBuilder: (context, state) => CupertinoPage(
        key: state.pageKey,
        child: const CartPage(),
      ),
    ),
    GoRoute(
      name: MainRoutes.checkout.route.name,
      path: MainRoutes.checkout.route.path,
      pageBuilder: (context, state) {
        final Order orderSummary = state.extra as Order? ?? const Order();
        return CupertinoPage(
          key: state.pageKey,
          child: Center(
            child: CheckoutPage(
              orderSummary: orderSummary,
            ),
          ),
        );
      },
    ),
    GoRoute(
      name: MainRoutes.foodItemDetails.route.name,
      path: MainRoutes.foodItemDetails.route.path,
      pageBuilder: (context, state) {
        final extrasMap = state.extra as Map<String, dynamic>?;
        final pageTitle = extrasMap?['previousPageTitle'];
        final foodItem = extrasMap?['foodItem'] as FoodItem?;
        return CupertinoPage(
          key: state.pageKey,
          child: ItemDetailPage(
            item: foodItem ?? const FoodItem(),
            previousPageTitle: pageTitle,
          ),
        );
      },
    )
  ];
}
