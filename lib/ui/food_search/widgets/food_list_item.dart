import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/domain/entity/index.dart';
import 'package:restaurant_app/ui/cart/cubit/index.dart';
import 'package:restaurant_app/utils/index.dart';
import 'package:restaurant_app/utils/router/index.dart';

class FoodListItem extends StatelessWidget {
  const FoodListItem({
    super.key,
    required this.item,
    this.isAddToCartButtonShowing = false,
    this.previousPageTitle,
    this.itemCount,
  });

  final FoodItem item;
  final bool? isAddToCartButtonShowing;
  final String? previousPageTitle;
  final int? itemCount;

  factory FoodListItem.withCartButton({
    required FoodItem item,
    String? previousPageTitle,
  }) =>
      FoodListItem(
        item: item,
        isAddToCartButtonShowing: true,
        previousPageTitle: previousPageTitle,
      );

  factory FoodListItem.cartItem({
    required FoodItem item,
    String? previousPageTitle,
    int? itemCount,
  }) =>
      FoodListItem(
        item: item,
        itemCount: itemCount,
        previousPageTitle: previousPageTitle,
      );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _navigateToItemDetail(item: item, context: context),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: context.w * .25,
            height: context.h * .1,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: CachedNetworkImageProvider(item.imageUrl ?? ''),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name ?? '',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '\$ ${item.price?.toStringAsFixed(2)}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: itemCount != null,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
              child: Text(
                itemCount?.toString() ?? '1',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Visibility(
            visible: isAddToCartButtonShowing ?? false,
            child: CupertinoButton(
              child: const Icon(
                CupertinoIcons.cart_badge_plus,
              ),
              onPressed: () => _addFoodItemToCart(context, item),
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToItemDetail({
    required FoodItem item,
    required BuildContext context,
  }) =>
      MainRoutes.foodItemDetails.navigateToItemDetails(
        context,
        foodItem: item,
        previousPageTitle: previousPageTitle ?? '',
      );

  void _addFoodItemToCart(
    BuildContext context,
    FoodItem item,
  ) =>
      context.read<CartCubit>().addItemToCart(
            Constants.userId,
            item,
          );
}
