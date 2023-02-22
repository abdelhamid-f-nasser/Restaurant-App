import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_app/domain/entity/index.dart';
import 'package:restaurant_app/utils/router/route_names.dart';

extension RouterExt on MainRoutes {

  void navigateToItemDetails(BuildContext context, {required String previousPageTitle, required FoodItem foodItem}) {
    context.pushNamed(
      MainRoutes.foodItemDetails.name,
      extra: {
        'previousPageTitle': previousPageTitle,
        'foodItem': foodItem
      },
    );
  }
}
