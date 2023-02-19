
import 'package:restaurant_app/utils/router/index.dart';

enum MainRoutes {
  /// Tab bar container route
  container(
    RouteModel(name: 'Container', path: '/:tab(${BottomTabBarRoutes.tabs})'),
  ),
  foodItemDetails(
    RouteModel(name: 'Item Detail', path: '/itemDetail/:id'),
  ),
  cart(
    RouteModel(name: 'Cart', path: '/cart'),
  ),
  checkout(
    RouteModel(name: 'Checkout', path: '/checkout'),
  ),
  search(
    RouteModel(
      name: BottomTabBarRoutes.search,
      path: '/Search',
    ),
  ),
  favourite(
    RouteModel(
      name: BottomTabBarRoutes.favourite,
      path: '/Favourite',
    ),
  );

  const MainRoutes(this.route);

  final RouteModel route;

  /// used to navigate between routes using names
  String get name => route.name;
}

/// Contains Scaffold TabBar routes keys
abstract class BottomTabBarRoutes {
  /// Search tabBar with food items list
  static const String search = 'Search';
  static const String favourite = 'Favourite';
  static const String tabs = '$search|$favourite';
}
