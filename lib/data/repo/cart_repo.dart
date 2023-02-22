import 'dart:async';

import 'package:restaurant_app/data/mapper_extension/index.dart';
import 'package:restaurant_app/domain/base_repo/index.dart';
import 'package:restaurant_app/domain/entity/index.dart';

class CartRepo extends BaseCartRepo {
  CartRepo(super.dataSource);

  @override
  Future<void> addItemToCart({
    required String userId,
    required FoodItem foodItem,
  }) async {
    dataSource.upsetOrder(userId: userId, foodItem: foodItem);
  }

  @override
  Stream<Cart> getOrderItems(String userId) =>
    dataSource.retrieveOrderForUser(userId).transform(
          StreamTransformer.fromHandlers(
            handleData: (data, sink) => sink.add(
              data?.toDomain() ??
                  Cart(
                    userId: userId,
                    foodItemList: const [],
                  ),
            ),
          ),
        );
}
