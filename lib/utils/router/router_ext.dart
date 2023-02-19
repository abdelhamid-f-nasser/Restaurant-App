import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_app/utils/router/route_names.dart';

extension RouterExt on MainRoutes {

  void navigateToItemDetails(BuildContext context, int itemId) {
    context.pushNamed(
      MainRoutes.foodItemDetails.name,
      params: {
        'id': itemId.toString(),
      },
    );
  }
}
